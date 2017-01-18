#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# Created on 2016-04-13 18:46:51
# Project: zealer_daily

from pyspider.libs.base_handler import *


class Handler(BaseHandler):
    crawl_config = {
    }

    @every(minutes=3)
    def on_start(self):
        self.crawl('http://fix.zealer.com/rephone', callback=self.index_page)

    @config(age=5*60)
    def index_page(self, response):
        for each in response.doc('a[href^="http"]').items():
            self.crawl(each.attr.href, callback=self.detail_page)

    @config(priority=2)
    def detail_page(self, response):
        return {
            # "title": ,
            # "intro": ,
            # "link": ,
            # "location": ,
            # "quality": , 
            # "brand": ,
            # "contact": ,
            # "price": ,
            # "hand_on_date": ,
            # "publish_time": ,
            # "from_site": ,
            # "remote_image_url": ,
        }
