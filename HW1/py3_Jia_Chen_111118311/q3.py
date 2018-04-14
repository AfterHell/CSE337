import urllib.request
from bs4 import BeautifulSoup

def main():
	quote_page = 'https://finance.google.com/finance/market_news'
	page = urllib.request.urlopen(quote_page)

	# parse the html using beautiful soup and store in variable `soup`
	soup = BeautifulSoup(page, 'html.parser')

	names = []
	sources = []
	dates = []
	result = []

	blockTags = soup.find_all('div', "g-section news sfe-break-bottom-16")
	for blockTag in blockTags:
		names.append(blockTag.find('span', "name").get_text().strip('\n'))
		sources.append(blockTag.find('span', "src").get_text())
		dates.append(blockTag.find('span', "date").get_text())

	outFile = open("top10articles.txt", "w+")

	for i in range(len(names)):
		result.append([names[i], sources[i], dates[i]])
		outFile.write(names[i])
		outFile.write(", ")
		outFile.write(sources[i])
		outFile.write(", ")
		outFile.write(dates[i])
		outFile.write("\n")

	outFile.close()

	return result



main()
