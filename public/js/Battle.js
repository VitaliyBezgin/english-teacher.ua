/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./resources/js/Battle.js":
/*!********************************!*\
  !*** ./resources/js/Battle.js ***!
  \********************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (/* binding */ Battle)
/* harmony export */ });
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

var Battle = /*#__PURE__*/function () {
  function Battle() {
    _classCallCheck(this, Battle);
  }

  _createClass(Battle, [{
    key: "startBattle",
    value: function startBattle() {
      var wordForms = $('.word_form'),
          i = 0,
          word_list_id = $('#words_list_id').text(),
          buttonToggle = true;
      $(wordForms[i]).fadeIn();
      $('form').submit(function (e) {
        e.preventDefault();

        if (buttonToggle === true) {
          buttonToggle = false;
          var word_id = $(this).find('input[name=word]').data('id'),
              answer = $(this).find('input[name=word]').val();
          axios.post("http://english-teacher.ua/check-words", {
            answer: answer,
            word_id: word_id,
            words_list_id: word_list_id
          }).then(function (response) {
            var server_response = response.data;
            console.log(server_response);

            if (server_response.result === 'true') {
              $(wordForms[i]).find('.result').text(server_response.icon);
            }

            if (server_response.result === 'wrong') {
              $(wordForms[i]).find('.result').html(server_response.icon + " <span> " + server_response.origin + "</span>");
            }

            if (server_response.message !== undefined) {
              $('.message').append("<p>" + server_response.message + "</p>");
            }

            if (server_response.status === 'finished') {
              //show button for download words file
              $('#getWordsFile').fadeIn();
              $('.words-list').after("<button type='button' class='btn btn-outline-dark try_again'>Try again</button>");
            }

            setTimeout(function () {
              $(wordForms[i]).remove();
              i++;
              buttonToggle = true;
              $(wordForms[i]).fadeIn();
            }, 1500);
            $('.try_again').click(function () {
              window.location = window.location.href;
            });
          })["catch"](function (error) {
            console.log(error);
          });
        }
      });
    }
  }]);

  return Battle;
}();


var battleObj = new Battle().startBattle();

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	// startup
/******/ 	// Load entry module
/******/ 	__webpack_require__("./resources/js/Battle.js");
/******/ 	// This entry module used 'exports' so it can't be inlined
/******/ })()
;