function submit(options) {
  const httpRequest = new XMLHttpRequest();
  const settings = Object.assign({
    url: '/',
    method: 'POST',
    data: '',
    contentType: 'application/x-www-form-urlencoded',
    load: (response) => {
      if (settings.success !== undefined && typeof settings.success === 'function') {
        if (response.explicitOriginalTarget !== undefined) {
          settings.success(response.explicitOriginalTarget.response);
        } else if (response.currentTarget) {
          settings.success(response.currentTarget.response);
        }
      };
    },
    error: (response) => {
      console.warn('error response:', response);
    }
  }, options);

  httpRequest.addEventListener("load", settings.load);
  httpRequest.addEventListener("error", settings.error);

  httpRequest.open(settings.method, settings.url);

  httpRequest.setRequestHeader('x-requested-with', "XMLHttpRequest");
  httpRequest.setRequestHeader('Content-Type', settings.contentType);
  httpRequest.setRequestHeader('Access-Control-Allow-Origin', settings.url);

  httpRequest.send(settings.data);
};

module.exports = submit;