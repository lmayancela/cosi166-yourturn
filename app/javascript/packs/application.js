// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require popper
//= require turbolinks
//= require bootstrap
//= require bootstrap-sprockets
//= require_tree.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'css/site.scss'
import "jquery"
import "bootstrap"
import "../stylesheets/application"
import "chartkick/chart.js"
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'
require("stylesheets/application.scss")

Rails.start()
Turbolinks.start()
ActiveStorage.start()




import "controllers"
