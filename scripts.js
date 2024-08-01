(() => {
  // update HTML validation link
  document.querySelector("footer .validator").href = `https://validator.w3.org/nu/?doc=${document.location.href}`;
})();
