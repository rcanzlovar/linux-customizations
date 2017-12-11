#!/usr/bin/python3

import bs4 as bs
import urllib.request
import urllib.parse


import time

values = {}


# get the timestamp for the mysql command 
values["timestamp"] = time.strftime('%Y-%m-%d %H:%M:%S')

source = urllib.request.urlopen("http://www.msn.com/en-us/weather/today/Longmont,Colorado,United-States/we-city-40.164,-105.100")

# (`timestamp`, 

# `city_name`, 
# `city_lat`, 
# `city_lon`, 


fields = { 
"Humidity":		"humidity", 
"Barometer":	"barometer", 
"Wind":			"wind", 
"Visibility":	"visibility", 
"Dew Point": 	"dewpoint", 
"Feels Like":	"feelslike" 
}

soup = bs.BeautifulSoup(source,'lxml')

body = soup.body
###print (body)


print ('###start - my locations ###')
for item in body.find_all('div', class_="mylocations" ):
	# get rid of the %99 escaped characters
	foo = (item.attrs['data-loc'])
	for thing in  urllib.parse.unquote(foo).split("&"):
		print ("Thing: ",thing)
		(key,val) = thing.split("=")
		if key == "c":
			values["city_name"] = val
		if key == "lat":
			values["city_lat"] = val
		if key == "long":
			values["city_lon"] = val

## get the temperature 
for item in body.find_all('span', class_="current" ):
	values["temperature"] = item.text
	print ("## Temp ", values["temperature"])

# get the other values 
print ('### weather-info ###')
for item in body.find_all('div', class_="weather-info" ): 
#	print (item.text) # whole item including all the bits 

	# this is the first span in the div.... 
	values["summary"] = item.find_all('span')[0].text 


	# get the other pieces... 
	for thing1 in item.find_all('li'):
		whole = thing1.text
		for thing2 in thing1.find_all('span'): 
			label = thing2.text 
			label = label.strip()
#			print ("span thing: ",thing2.text) 
		value = whole.replace(label,'') 
		# clear extraneous bits
		value = value.replace("°",'') 
		value = value.replace(" mi",'') 
		value = value.replace(" in",'') 
		value = value.replace("%",'') 
		value = value.strip()
		print (label + ": ",value)
		if  (fields[label]):
			values[fields[label]] = value


#	['HTML_FORMATTERS', 'XML_FORMATTERS', '__bool__', '__call__', '__class__', '__contains__', '__copy__', '__delattr__', '__delitem__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattr__', '__getattribute__', '__getitem__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__setitem__', '__sizeof__', '__str__', '__subclasshook__', '__unicode__', '__weakref__', '_all_strings', '_attr_value_as_string', '_attribute_checker', '_find_all', '_find_one', '_formatter_for_name', '_is_xml', '_lastRecursiveChild', '_last_descendant', '_select_debug', '_selector_combinators', '_should_pretty_print', '_tag_name_matches_and', 'append', 'attribselect_re', 'attrs', 'can_be_empty_element', 'childGenerator', 'children', 'clear', 'contents', 'decode', 'decode_contents', 'decompose', 'descendants', 'encode', 'encode_contents', 'extract', 'fetchNextSiblings', 'fetchParents', 'fetchPrevious', 'fetchPreviousSiblings', 'find', 'findAll', 'findAllNext', 'findAllPrevious', 'findChild', 'findChildren', 'findNext', 'findNextSibling', 'findNextSiblings', 'findParent', 'findParents', 'findPrevious', 'findPreviousSibling', 'findPreviousSiblings', 'find_all', 'find_all_next', 'find_all_previous', 'find_next', 'find_next_sibling', 'find_next_siblings', 'find_parent', 'find_parents', 'find_previous', 'find_previous_sibling', 'find_previous_siblings', 'format_string', 'get', 'getText', 'get_attribute_list', 'get_text', 'has_attr', 'has_key', 'hidden', 'index', 'insert', 'insert_after', 'insert_before', 'isSelfClosing', 'is_empty_element', 'known_xml', 'name', 'namespace', 'next', 'nextGenerator', 'nextSibling', 'nextSiblingGenerator', 'next_element', 'next_elements', 'next_sibling', 'next_siblings', 'parent', 'parentGenerator', 'parents', 'parserClass', 'parser_class', 'prefix', 'preserve_whitespace_tags', 'prettify', 'previous', 'previousGenerator', 'previousSibling', 'previousSiblingGenerator', 'previous_element', 'previous_elements', 'previous_sibling', 'previous_siblings', 'quoted_colon', 'recursiveChildGenerator', 'renderContents', 'replaceWith', 'replaceWithChildren', 'replace_with', 'replace_with_children', 'select', 'select_one', 'setup', 'string', 'strings', 'stripped_strings', 'tag_name_re', 'text', 'unwrap', 'wrap']
keys = ""
vals = ""
print (values)
for key in values:
	print (key + "=\"" + values[key] + "\",")
	keys = keys + key + ","
	vals = vals + values[key] + ","

sql = "INSERT into `weather` (" + keys + ") VALUES (" + vals + ")"
print ("sql = ",sql)
##insert into table set fieldr=valoe, field2=val2, etc=something
# sql =     "INSERT INTO `weather` 
# (`timestamp`, 
# `city_name`, 
# `city_lat`, 
# `city_lon`, 
# `temperature`, 
# `humidity`, 
# `barometer`, 
# `conditions`, 
# `visibility`, 
# `dewpoint`, 
# `feelslike`) 
# VALUES 
# ('" . $timestamp . "', 
# '" . $weather_values{'city'} . "', 
# '" . $weather_values{'lat'} . "', 
# '" . $weather_values{'lon'} . "', 
# '" . $weather_values{'temperature'} . "', 
# '" . $weather_values{'humidity'} . "', 
# '" . $weather_values{'barometer'} . "', 
# '" . $weather_values{'conditions'} . "', 
# '" . $weather_values{'visibility'} . "', 
# '" . $weather_values{'dewpoint'} . "',
# '" . $weather_values{'feelslike'} . "');";