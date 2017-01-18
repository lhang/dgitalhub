# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class DgitalhubSpidersItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    title = scrapy.Field()
    intro = scrapy.Field()
    link = scrapy.Field()
    location = scrapy.Field()
    quality = scrapy.Field()
    brand = scrapy.Field()
    contact = scrapy.Field()
    price = scrapy.Field()
    hand_on_date = scrapy.Field()
    publish_time = scrapy.Field()
    from_site = scrapy.Field()
    remote_image_url = scrapy.Field()
