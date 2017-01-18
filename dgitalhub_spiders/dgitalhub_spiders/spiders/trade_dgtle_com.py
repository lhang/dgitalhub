# -*- coding: utf-8 -*-
import scrapy
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule

from dgitalhub_spiders.items import DgitalhubSpidersItem


class TradeDgtleComSpider(CrawlSpider):
    name = 'trade.dgtle.com'
    allowed_domains = ['trade.dgtle.com']
    start_urls = ['http://trade.dgtle.com/']

    rules = (
        Rule(LinkExtractor(allow=r'/dgtle_module\.php\?mod=trade&ac=index&typeid=&PName=&searchsort=0&page=.*'),
                           callback=None, follow=True),
        Rule(LinkExtractor(allow=r'/thread-.*\.html'),
                           callback='parse_item', follow=False),
    )

    def parse_item(self, response):
        i = DgitalhubSpidersItem()

        i['from_site'] = 'dgtle.com'
        i['title'] = response.xpath('//*[@id="thread_subject"]/p/text()').extract()[0]
        intro_temp = response.xpath('//*[@id="ct"]/div[1]/div/div[1]/div[4]/div/div[1]/div[1]/table//text()').extract()
        for p in intro_temp:
            i['intro'] = i.get('intro', '') + p

        i['link'] = response.url
        i['location'] = response.xpath('//*[@id="li_3"]/span/text()').extract()[0]
        i['price'] = response.xpath('//*[@id="ct"]/div[1]/div/div[1]/span[2]/text()').extract()[0]
        i['quality'] = response.xpath('//*[@id="li_1"]/span/text()').extract()[0]
        i['brand'] = None

        contact = response.xpath('//*[@id="sale_info_big_box"]/div[2]/p[3]/span/text()').extract()
        i['contact'] = None if len(contact) == 0 else contact[0]

        i['hand_on_date'] = response.xpath('//*[@id="li_2"]/span/text()').extract()[0]

        images = response.xpath('//*[@id="ct"]/div[1]/div/div[1]/img/@src').extract()
        i['remote_image_url'] = None if len(images) == 0 else images[0]

        i['publish_time'] = response.xpath('//*[@id="ct"]/div[1]/div/div[1]/div[1]/span[2]/em[2]/text()').extract()[0]

        return i
