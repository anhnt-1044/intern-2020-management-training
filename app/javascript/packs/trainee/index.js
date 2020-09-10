require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')
require('jquery')
require('bootstrap')
import I18n from 'i18n-js';
global.I18n = I18n;

import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'
window.Swal = Swal;

import {updateTask} from './task';
import {scrollPaginator} from './paginator';

$(document).on('turbolinks:load', function() {
  updateTask();
  scrollPaginator();
})
