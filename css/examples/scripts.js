'use strict'

const inFrame = () => {
  try {
      return window.self !== window.top;
  } catch (e) {
      return true;
  }
}

if (inFrame()) {
  document.querySelector('.back').hidden = true;
}
