/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./app/index.ts":
/*!**********************!*\
  !*** ./app/index.ts ***!
  \**********************/
/***/ (() => {

eval("\ndocument.addEventListener(\"DOMContentLoaded\", function () {\n    // Your code here\n    pre_edit();\n});\nconst animals = {\n    Lady: {\n        animalid: 1,\n        name: \"Lady\",\n        owner_id: 1,\n        ensured: true,\n        for_adoption: false,\n        belongs_to_vet: false,\n        created_at: \"time\",\n        updated_at: \"time2\",\n        medical_history: 1,\n    },\n    Romina: {\n        animalid: 2,\n        name: \"Romina\",\n        owner_id: 1,\n        ensured: true,\n        for_adoption: false,\n        belongs_to_vet: false,\n        created_at: \"time\",\n        updated_at: \"time2\",\n        medical_history: 2,\n    },\n};\nclass animal {\n    constructor(animalid, name, owner_id, ensured, for_adoption, belongs_to_vet, created_at, medical_history, ...rest) {\n        // this.animalid = animalid;\n        this.name = name;\n        this.owner_id = owner_id;\n        this.ensured = ensured;\n        this.for_adoption = for_adoption;\n        this.belongs_to_vet = belongs_to_vet;\n        this.created_at = created_at;\n        this.updated_at = this.current_time();\n        this.medical_history = medical_history;\n    }\n    current_time() {\n        var today = new Date();\n        var date = today.getDate() +\n            \"-\" +\n            (today.getMonth() + 1) +\n            \"-\" +\n            today.getFullYear();\n        var time = today.getHours() + \":\" + today.getMinutes() + \":\" + today.getSeconds();\n        var complete_date = date + \", \" + time;\n        return { complete_date };\n    }\n}\nfunction pre_edit() {\n    let preElement = document.getElementById(\"preElement\");\n    if (preElement) {\n        preElement.innerHTML = JSON.stringify(animals);\n    }\n    else {\n        throw new Error();\n    }\n}\n\n\n//# sourceURL=webpack://veterinary/./app/index.ts?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = {};
/******/ 	__webpack_modules__["./app/index.ts"]();
/******/ 	
/******/ })()
;