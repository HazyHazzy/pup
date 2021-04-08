import consumer from "./consumer";

const flipButton = () => {
  // const button = document.querySelector("#toggle");
  // const text = document.querySelector("#text");
  // button.addEventListener("click", (event) => {
  //   let element = button.innerText;
  //   if (element == "Read More") {
  //     element = "Read Less";
  //     text.slideToggle();
  //   } else {
  //     element = "Read More";
  //     text.slideToggle();
  //   }
  // });

  const toggleButtons = document.querySelectorAll('.toggle-content');
  const fullTextWrappers = document.querySelectorAll('.fulltext');

  [].forEach.call(fullTextWrappers, function(fullTextWrapper) {
    // hide all full text on load
    fullTextWrapper.setAttribute('hidden', true);
  });

  [].forEach.call(toggleButtons, function(toggleButton) {
    // show toggle more buttons
    toggleButton.removeAttribute('hidden');

    // add listener for each button
    toggleButton.addEventListener('click', function () {

      const fullTextWrapper = this.parentElement.querySelector('.fulltext');
      const toggleButtonText = this.querySelector('.text');

      // change attributes and text if full text is shown/hidden
      if (!fullTextWrapper.hasAttribute('hidden')) {
        toggleButtonText.innerText = 'Show More';
        fullTextWrapper.setAttribute('hidden', true);
        toggleButton.setAttribute('aria-expanded', false);
      } else {
        toggleButtonText.innerText = 'Show Less';
        fullTextWrapper.removeAttribute('hidden');
        toggleButton.setAttribute('aria-expanded', true);
      }
    });
  });
}

export { flipButton };


