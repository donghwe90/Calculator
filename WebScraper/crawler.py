import collections
import string

from timeit import default_timer
from urllib.parse import urldefrag, urljoin, urlparse

import bs4
import requests

headers = {
    'User-Agent': 'test',
    'From': "donghwe90@gmail.com"
}


# ------------------------------------------------------------------------------
def crawler(startpage, maxpages=100, singledomain=True):
    """
    Crawl the web starting from specified page.
    1st parameter = URL of starting page
    maxpages = maximum number of pages to crawl
    singledomain = whether to only crawl links within startpage's domain
    """

    page_queue = collections.deque()  # queue of pages to be crawled
    page_queue.append(startpage)
    crawled = []  # list of pages already crawled
    domain = urlparse(startpage).netloc if singledomain else None

    pages = 0  # number of pages crawled
    failed = 0  # number of links that couldn't be crawled

    sess = requests.session()  # initialize the session
    while pages < maxpages and page_queue:
        url = page_queue.popleft()  # get next page to crawl (FIFO queue)

        # read the page
        try:
            response = sess.get(url, headers=headers)
        except (requests.exceptions.MissingSchema,
                requests.exceptions.InvalidSchema):
            print("*FAILED*:", url)
            failed += 1
            continue
        if not response.headers['content-type'].startswith('text/html'):
            continue  # Skip non-HTML content

        # create a BeautifulSoup object
        soup = bs4.BeautifulSoup(response.text, "html.parser")

        # process the page
        crawled.append(url)
        pages += 1
        if pagehandler(url, response, soup):
            # get the links from this page and add them to the frontier
            links = getlinks(url, domain, soup)
            for link in links:
                if not url_in_list(link, crawled) and not url_in_list(link, page_queue):
                    page_queue.append(link)

    print('{0} pages crawled, {1} links failed.'.format(pages, failed))
    print(page_queue)


# -------------------------------------------------------------------------------

def getlinks(pageurl, domain, soup):
    """
    Returns a list of links from from this page to be crawled.
    pageurl = URL of this page
    domain = domain being crawled (None to return links to *any* domain)
    soup = BeautifulSoup object for this page
    """

    # retrieve all links in the page
    links = [a.attrs.get('href') for a in soup.select('a[href]')]

    # remove fragment identifiers
    links = [urldefrag(link)[0] for link in links]

    # remove any empty strings
    links = [link for link in links if link]

    # if it's a relative URL, change to absolute URL
    links = [link if bool(urlparse(link).netloc) else urljoin(pageurl, link) \
             for link in links]

    # if only crawling a single domain, remove links to other domains
    if domain:
        links = [link for link in links if samedomain(urlparse(link).netloc, domain)]

    return links


# -------------------------------------------------------------------------------
def pagehandler(pageurl, pageresponse, soup):
    """Function to be customized for processing of a single page.
    pageurl = URL of this page
    pageresponse = page content; response object from requests module
    soup = Beautiful Soup object created from pageresponse
    Return value = whether or not this page's links should be crawled.
    """
    print('Crawling:' + pageurl + ' ({0} bytes)'.format(len(pageresponse.text)))
    return True


# ------------------------------------------------------------------------------

def samedomain(url1, url2):
    """
    Check if the two domain are the same.
    for example,
    samedomain('www.laptopmag.com', 'laptopmag.com') == True
    """
    domain1 = url1.lower()
    if '.' in domain1:
        domain1 = domain1.split('.')[-2] + '.' + domain1.split('.')[-1]

    domain2 = url2.lower()
    if '.' in domain2:
        domain2 = domain2.split('.')[-2] + '.' + domain2.split('.')[-1]

    return domain1 == domain2


# ------------------------------------------------------------------------------
def url_in_list(url, listobj):
    """
    Determine whether a URL is a duplicate by checking the prefix
    ('http://', and 'https://' are considered the same.
    """
    http_version = url.replace('https://', 'http://')
    https_version = url.replace('http://', 'https://')
    return (http_version in listobj) or (https_version in listobj)


# ------------------------------------------------------------------------------

if __name__ == "__main__":
    START = default_timer()
    crawler('https://www.laptopmag.com/', maxpages=10, singledomain=True)
    END = default_timer()
    print('Elapsed time (seconds) = ' + str(END - START))
