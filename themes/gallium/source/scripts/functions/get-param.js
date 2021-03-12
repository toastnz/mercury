function getParam(param) {
  try {
    return window.location.search.replace('?','').split('&').filter((item) => item.indexOf(`${param}=`) >= 0)[0].replace(`${param}=`, '');
  }catch(err) {
    console.log(err);
    return false;
  }
};

module.exports = getParam;