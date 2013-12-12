#
# GAMMARAY_ADD_PLUGIN: create a gammaray plugin, install at the right place, etc
#

#  Copyright (c) 2011-2013 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

# Author: Volker Krause <volker.krause@kdab.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.

macro(gammaray_add_plugin _target_name _desktop_file)
  set(_build_target_dir "${PROJECT_BINARY_DIR}/${PLUGIN_INSTALL_DIR}/gammaray/${GAMMARAY_PLUGIN_VERSION}")
  set(_install_target_dir "${PLUGIN_INSTALL_DIR}/gammaray/${GAMMARAY_PLUGIN_VERSION}")

  add_library(${_target_name} MODULE ${ARGN})
  set_target_properties(${_target_name} PROPERTIES
    PREFIX ""
    LIBRARY_OUTPUT_DIRECTORY ${_build_target_dir}
  )
  install(TARGETS ${_target_name} DESTINATION ${_install_target_dir})
  install(FILES ${_desktop_file} DESTINATION ${_install_target_dir})
  configure_file("${CMAKE_CURRENT_SOURCE_DIR}/${_desktop_file}" "${_build_target_dir}/${_desktop_file}")
endmacro()
