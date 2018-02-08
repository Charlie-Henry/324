import pdb
import re
import operator


text = open("war_of_the_worlds.txt", "rb").read()
allwords = open('allwords.txt', 'w')
uniquewords = open('uniquewords.txt', 'w')
wordfreq = open('wordfrequency.txt', 'w')
#text = open("test.txt", "rb").read()
text = str(text)
text = text.lower()
text = text.replace("\\r"," ")
text = text.replace("\\n"," ")
text = text.replace("\\","")
text = text.replace("b\'","")

def extractWords(text):
	output = re.findall('[a-z]+',text)
	return output

def allWords(txt_list,allwords):
	for word in txt_list:
		allwords.write("\n" + word)

def uniqueWords(txt_list,file):
	output = {}
	for word in txt_list:
		keys = list(output.keys())
		if word not in keys:
			output[word] = int(1)
		else:
			output[word] +=1

	#keys = list(output.keys())
	for key in output:
		if output[key] == 1:
			file.write("\n" + key)
	return output

def wordFrequency(word_dict,file):
	words = list(word_dict.keys())
	freq = {}
	for word in words:
		freq_keys = list(freq.keys())
		if word_dict[word] not in freq_keys:
			freq[word_dict[word]] = 1
		else:
			freq[word_dict[word]] += 1

	sort_freq = sorted(freq.items(), key=operator.itemgetter(1))
	for row in sort_freq:
		file.write("\n" + str(row[0]) + " : " + str(row[1]))
	return freq

text_list = extractWords(text)
allWords(text_list,allwords)
word_dict = uniqueWords(text_list,uniquewords)
freq_dict = wordFrequency(word_dict,wordfreq)


