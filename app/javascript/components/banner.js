import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["PARIS", "LONDON", "BERLIN"],
    typeSpeed: 110,
    loop: true
  });
};

export { loadDynamicBannerText };


