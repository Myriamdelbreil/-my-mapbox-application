# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "nominatim" # @0.1.0
pin "assert" # @2.1.0
pin "buffer" # @2.1.0
pin "crypto" # @2.1.0
pin "events" # @2.1.0
pin "http" # @2.1.0
pin "https" # @2.1.0
pin "net" # @2.1.0
pin "process" # @2.1.0
pin "querystring" # @2.1.0
pin "request" # @2.9.203
pin "stream" # @2.1.0
pin "tls" # @2.1.0
pin "tqueue" # @0.1.0
pin "url" # @2.1.0
pin "util" # @2.1.0
pin "leaflet-css" # @0.1.0
pin "leaflet" # @1.9.4
pin "leaflet.markercluster", to: "https://unpkg.com/leaflet.markercluster@1.5.0/dist/leaflet.markercluster.js"
