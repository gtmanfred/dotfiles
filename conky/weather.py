#!/usr/bin/env python2
"""
weather.py
Copyright 2011 Aaron Goss

This file is part of Monitor Toys.

Monitor Toys is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Monitor Toys is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Monitor Toys.  If not, see <http://www.gnu.org/licenses/>.

This script retrieves content from "Yahoo! Weather" RSS feeds and parses
the results.
"""

import sys, urllib, urllib2
from optparse import OptionParser
from xml.dom import minidom as minidom

(TEMP, DIST, SPEED, PRESS)         = xrange(0,4)
(WIND_DIR, WIND_SPEED, WIND_CHILL) = xrange(0,3)

DEFAULT_ZIP   = "78233"  #Modify if you want to set a default zip code
DEFAULT_UNIT  = "c" #Change to "c" to receive results in celsius
YAHOO_WEATHER = "http://xml.weather.yahoo.com/forecastrss"

WEATHER_ICONS = {0:  "1",  #tornado
                 1:  "4",  #tropical storm
                 2:  "3",  #hurricane
                 3:  "n",  #severe tstorms
                 4:  "l",  #tstorms
                 5:  "x",  #rain+snow
                 6:  "y",  #rain+sleet
                 7:  "y",  #snow+sleet
                 8:  "y",  #freezing drizzle
                 9:  "s",  #drizzle
                 10: "x",  #freezing rain
                 11: "j",  #showers
                 12: "j",  #showers
                 13: "q",  #snow flurries
                 14: "p",  #light snow showers
                 15: "8",  #blowing snow
                 16: "r",  #snow
                 17: "u",  #hail
                 18: "i",  #showers
                 19: "7",  #dust
                 20: "10", #foggy
                 21: "9",  #haze
                 22: "10", #smoky
                 23: "8",  #blustery
                 24: "6",  #windy
                 25: "w",  #cold
                 26: "e",  #cloudy
                 27: "D",  #mostly cloudy (night)
                 28: "d",  #mostly cloudy (day)
                 29: "C",  #partly cloudy (night)
                 30: "c",  #partly cloudy (day)
                 31: "A",  #clear (night)
                 32: "a",  #sunny
                 33: "b",  #fair (night)
                 34: "b",  #fair (day)
                 35: "v",  #rain+hail
                 36: "5",  #hot
                 37: "l",  #isolated tstorms
                 38: "l",  #scattered tstorms
                 39: "l",  #scattered tstorms
                 40: "s",  #scattered showers
                 41: "r",  #heavy snow
                 42: "p",  #scattered snow showers
                 43: "g",  #heavy snow
                 44: "c",  #partly cloudy
                 45: "m",  #thundershowers
                 46: "q",  #snow showers
                 47: "l"   #isolated thundershowers
}

BAROMETER_CODES = {
                0: "Steady",
                1: "Rising",
                2: "Falling"
}

def main(argv):
    """
    main()
      - argv: arguments passed from the command-line

      This method parses the arguments passed from the command-line.  If an invalid argument is passed,
      invalid, this method will output an error and immediately return.
      Once all arguments are parsed, this method requests the XML content from the RSS feed, sends it to
      an XML parser which returns a DOM object, and passes this object around to any parsing-routines
      which are selected by the options in the command-line.

      This method returns 0 if all URL fetches/parsing succeeds, 1 otherwise.
    """
    parser = OptionParser()
    parser.add_option("-a", "--atmosphere", dest="atmosphere", action="store_true", default=False,
                      help="prints the atmospheric information for this location")
    parser.add_option("-d", "--description", dest="description", action="store_true", default=False,
                      help="prints the description from \"Yahoo! Weather\" for the day")
    parser.add_option("-i", "--icon-map", dest="icon", action="store_true", default=False,
                      help="prints the icon-character which maps to the ConkyWeather font set for the given conditions")
    parser.add_option("-l", "--location", dest="location", action="store_true", default=False,
                      help="prints the location (latitude and longitude) of this location")
    parser.add_option("-w", "--wind-info", dest="windInfo", action="store_true", default=False,
                      help="prints the current wind chill, speed, and direction information for this location")
    parser.add_option("-t", "--temperature", dest="temperature", action="store_true", default=False,
                      help="prints the current temperature in whatever units were specified (Farenheit by default)")
    parser.add_option("-u", "--unit", dest="unit", default=DEFAULT_UNIT, help="unit for reporting temperature")
    parser.add_option("-z", "--zip-code", dest="zipCode", default=DEFAULT_ZIP, help="zip code for reporting weather")

    (opts, args) = parser.parse_args(argv)

    if opts.zipCode in (None, ""):
        print("Error: --zip-code is a required parameter")
        return 1

    content = getWeatherContent(opts.zipCode, opts.unit)

    if content in ("", None):
        print("Error obtaining RSS feed")
        return 1

    document    = minidom.parseString(content)
    itemNode    = getItemNode(document)
    conditions  = getConditionAttributes(itemNode)
    units       = getUnits(document)

    if opts.atmosphere:
        print(getAtmosphereInfo(document, units))

    if opts.description:
        print(getDescription(conditions, units))

    if opts.icon:
        print(getWeatherIcon(conditions))

    if opts.location:
        print(getLocation(itemNode))

    if opts.temperature:
        print(getTemperature(conditions, units))

    if opts.windInfo:
        print(getWindInfo(document, units))

    return 0

def getWeatherContent(zipCode, unit):
    """
    getWeatherContent()
      - zipCode: location from which this request should come from
      - unit:    temperature unit being requested

      This method opens the YAHOO_WEATHER URL, passing in the values
      for zip code and units.  This URL returns XML content, which is
      returned to the calling method.

      If the URL fetch fails, this method will print an error, and will
      return None.  If it returns an empty-string, something went wrong
      and the caller needs to handle it.
    """
    values   = urllib.urlencode({"p": zipCode, "u": unit})
    request  = urllib2.Request('?'.join([YAHOO_WEATHER, values]))
    response = urllib2.urlopen(request)
    content  = ""
    try:
        content = response.read()
    except urllib2.URLError, e:
        print("Could not retrieve URL: %s" % (YAHOO_WEATHER))
        return None
    finally:
        if response is not None:
            response.close()
    return content

def getItemNode(document):
    """
    getItemNode
      - document: the XML doc from the RSS feed

      The <item/> node contains summarized information which is rich in
      content.  This method returns this Node.
    """
    return document.getElementsByTagName("item")[0]

def getUnits(document):
    """
    getUnits()
      - document: the XML doc from the RSS feed

      The <yweather:units /> contains information regarding which units will
      appear in the rest of the XML doc.

      This method parses these units into a dictionary, which maps each unit
      to an appropriate key.  This allows us to access these units in other
      methods for nicely-formatted data.
    """
    unitNode = document.getElementsByTagName("yweather:units")[0]
    temp     = unitNode.attributes["temperature"].value
    dist     = unitNode.attributes["distance"].value
    speed    = unitNode.attributes["speed"].value
    press    = unitNode.attributes["pressure"].value
    return {TEMP: temp, DIST: dist, SPEED: speed, PRESS: press}

def getLocation(itemNode):
    """
    getLocation()
      - itemNode: the Node containing information from the <item/> tag

      This method parses the <item/> node, returning data from two sub-tags: geo:lat and geo:long.
      These two tags contain information regarding the physical location requested in the original
      URL (zip code).  This method returns a formatted string containing both latitude and longitude.
    """
    lat  = itemNode.getElementsByTagName("geo:lat")[0].firstChild.nodeValue
    long = itemNode.getElementsByTagName("geo:long")[0].firstChild.nodeValue
    return ': '.join(["Lat/Long", '/'.join([lat, long])])

def getConditionAttributes(itemNode):
    """
    getConditionAttributes()
      - itemNode: the Node containing information from the <item/> tag

      This method parses out the attributes found in the <yweather:condition/> tag.  This tag
      contains summary data for the current weather conditions.
      This method returns the attribute-map which describes this content.
    """
    condition = itemNode.getElementsByTagName("yweather:condition")[0]
    return condition.attributes

def getDescription(condition, units):
    """
    getDescription()
      - condition: the attribute list parsed from the <yweather:condition/> tag
      - units:     the units parsed from the <yweather:units/> tag

      This method parses out the basic description attributes from the <yweather:condition/> tag.
      This information is joined with spaces and commas and returned to the calling method.
    """
    return ' '.join([', '.join([condition["text"].value, condition["temp"].value]), units[TEMP]])

def getTemperature(condition, units):
    """
    getTemperature()
      - condition: the attribute list parsed from the <yweather:condition/> tag
      - units:     the units parsed from the <yweather:units/> tag

      This method parses out the temperature values found in the <yweather:condition/> tag.  This
      information is returned in a string joined with the temperature units.
    """
    return ' '.join([condition["temp"].value, units[TEMP]])

def getWeatherIcon(condition):
    """
    getWeatherIcon()
      - conditions: the attribute list parsed from the <yweather:condition/> tag

      This method parses out the code ID for the current weather condition and maps it to one
      of the characters we expect in the current font set.  This character is returned to the
      calling method.
    """
    return WEATHER_ICONS[int(condition["code"].value)]

def getWindInfo(document, units, info=None):
    """
    getWindInfo()
      - document: the XML parsed from the RSS feed
      - units:    the units parsed from the <yweather:units/> tag
      - info:     an optional attribute to parse from the <yweather:wind/> tag

      This method parses the <yweather:wind/> tag, extracting attribute information.  If the
      user passes in an info parameter, it will attempt to extract this info as an attribute
      key.  This attribute value will be returned.  Otherwise, this method will iterate across
      all attributes in this element, returning their information (along w/magic strings) to
      the calling method.
    """
    windNode   = document.getElementsByTagName("yweather:wind")[0]
    attributes = windNode.attributes

    if info is not None:
        return ':'.join([info, attributes[info].value])
    else:
        chill = ''.join(["Wind Chill:     ", ''.join([attributes["chill"].value, units[TEMP]])])
        speed = ''.join(["Wind Speed:     ", ''.join([attributes["speed"].value, units[SPEED]])])
        dir   = ''.join(["Wind Direction: ", attributes["direction"].value])
        return '\n'.join([chill, speed, dir])

def getAtmosphereInfo(document, units, info=None):
    """
    getAtmosphereInfo()
      - document: the XML parsed from the RSS feed
      - units:    the units parsed from the <yweather:units/> tag
      - info:     an optional attribute to parse from the <yweather:atmosphere/> tag

      This method parses the <yweather:atmosphere/> tag, extracting attribute information.
      If the user passes an info parameter, it will attempt to extract this info as an attribute
      key.  This attribute value is returned.  Otherwise, this method will iterate across all
      attributes in this element, returning their information (along w/magic strings) to the
      calling method.
    """
    atmoNode   = document.getElementsByTagName("yweather:atmosphere")[0]
    attributes = atmoNode.attributes

    if info is not None:
        return ':'.join([info, attributes[info].value])
    else:
        barometer  = BAROMETER_CODES[int(attributes["rising"].value)]

        humidity   = ''.join(["Humidity:   ", attributes["humidity"].value, "%"])
        pressure   = ''.join(["Pressure:   ", ''.join([attributes["pressure"].value, units[PRESS]])])
        visibility = ' '.join(["Visibility:", ''.join([attributes["visibility"].value, units[PRESS]]), barometer])

        return '\n'.join([humidity, visibility, pressure])

if __name__ == "__main__":
    sys.exit(main(sys.argv))

