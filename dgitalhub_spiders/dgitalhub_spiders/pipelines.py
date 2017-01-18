# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html
import requests
import json

class DgitalhubSpidersPipeline(object):
    # request_url = 'http://123.206.55.154/dgitals.json'
    request_url = 'http://localhost:3000/dgitals.json'

    def process_item(self, item, spider):
        if item['title'] and item['link']:
            try:
                headers = {'content-type': 'application/json'}
                sessions = requests.Session()
                j = json.dumps({"dgital": dict(item)})
                req = sessions.post(self.request_url, j, headers=headers)
                if not req.ok:
                    req = sessions.post(self.request_url, j)

            except Exception as e:
                print e
            return item
        else:
            raise DropItem("Missing price in %s" % item)
