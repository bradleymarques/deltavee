const { environment } = require('@rails/webpacker')
const typescript =  require('./loaders/typescript')
const webpack = require('webpack')

environment.plugins.prepend(
    'Provide',
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      jquery: 'jquery',
      'window.jQuery': 'jquery',
      Popper: ['@popperjs/core'],
    })
)

environment.loaders.prepend('typescript', typescript)
module.exports = environment
