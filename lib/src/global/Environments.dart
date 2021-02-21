const String BASIC_URL = 'https://gateway.marvel.com:443/v1/public/';
const API_KEY = 'a1fe6bc58767dd6663885aaff36f387b';
const TS = '9';
const HASH = 'e8cf1b083b247e70f52b34d10df42ee3';

class Environments {
  static String getMountedUrl(String path) =>
      '${BASIC_URL}${path}?apikey=${API_KEY}&ts=${TS}&hash=${HASH}';
}
