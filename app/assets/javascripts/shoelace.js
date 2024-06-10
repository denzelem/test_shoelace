import '@shoelace-style/shoelace/dist/themes/light.css'
import '@shoelace-style/shoelace/dist/components/option/option'
import '@shoelace-style/shoelace/dist/components/select/select'

// NOTE: @shoelace-style does not export the icons as files, so we added the bootstrap-icons package manually and resolve
// it in webpack directly. https://shoelace.style/tutorials/integrating-with-rails was not the preferred way.

import { registerIconLibrary } from '@shoelace-style/shoelace/dist/utilities/icon-library'

const icons = {}
const boostrapIconsRequire = require.context('bootstrap-icons/icons', false, /\.svg$/)
boostrapIconsRequire.keys().forEach((key) => {
  const iconName = key.replace('./', '').replace('.svg', '')
  icons[iconName] = boostrapIconsRequire(key)
})

registerIconLibrary('default', {
  resolver: name => icons[name]
})
