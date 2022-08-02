# If Qt has support for webkit, add it:
qtHaveModule(webkit):CONFIG += PythonQtWebKit

TARGET   = PythonQt_QtAll-Qt5-PythonXY
TEMPLATE = lib

DESTDIR    = ../../lib

include ( ../../build/common.prf )  
include ( ../../build/PythonQt.prf )  
TARGET = $$replace(TARGET, PythonXY, Python$${PYTHON_VERSION})

CONFIG +=  qt static

DEFINES += PYTHONQT_QTALL_EXPORTS

HEADERS +=                \
  PythonQt_QtAll.h
  
SOURCES +=                \
  PythonQt_QtAll.cpp

QT += gui network xml
QT += widgets printsupport

include ($$PYTHONQT_GENERATED_PATH/com_trolltech_qt_core/com_trolltech_qt_core.pri)
include ($$PYTHONQT_GENERATED_PATH/com_trolltech_qt_gui/com_trolltech_qt_gui.pri)
include ($$PYTHONQT_GENERATED_PATH/com_trolltech_qt_xml/com_trolltech_qt_xml.pri)
include ($$PYTHONQT_GENERATED_PATH/com_trolltech_qt_network/com_trolltech_qt_network.pri)

PythonQtWebKit {
  QT += webkit webkitwidgets
  DEFINES += PYTHONQT_WITH_WEBKIT
  include ($$PYTHONQT_GENERATED_PATH/com_trolltech_qt_webkit/com_trolltech_qt_webkit.pri)
}
