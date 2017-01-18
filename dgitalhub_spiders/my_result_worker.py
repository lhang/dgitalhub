# -*- encoding: utf-8 -*-
import requests
import json

from pyspider.result import ResultWorker

class DgitalHubResultWorker(ResultWorker):
    def __init__(self, *args, **kwargs):
        super(DgitalHubResultWorker, self).__init__(*args, **kwargs)
        self.request_url = 'http://123.206.55.154/dgitals.json'
        self.headers = {'content-type': 'application/json'}
    
    def on_result(self, task, result):
        print result
        self.post_to_dgitlehub(result)
        
    def post_to_dgitlehub(self, result):
        assert result['publish_time']
        assert result['link']
        s = requests.Session()
        req = s.post(self.request_url, json.dumps({"dgital":dict(result)}),
                            headers=self.headers)
        assert req.ok


class DevelopWorker(DgitalHubResultWorker):
    def __init__(self, *args, **kwargs):
        super(DevelopWorker, self).__init__(*args, **kwargs)
        self.request_url = 'http://localhost:3000/dgitals.json'
        self.headers = {'content-type': 'application/json'}
