/****************************************************************************
** Meta object code from reading C++ file 'remote_ptam.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.7)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../src/ethzasl_ptam/rqt_ptam/include/rqt_ptam/remote_ptam.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'remote_ptam.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.7. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_rqt_ptam__RemotePTAM[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      22,   21,   21,   21, 0x09,
      50,   44,   21,   21, 0x09,
      82,   74,   21,   21, 0x09,
      96,   74,   21,   21, 0x09,
     114,   21,   21,   21, 0x09,
     124,   21,   21,   21, 0x09,

       0        // eod
};

static const char qt_meta_stringdata_rqt_ptam__RemotePTAM[] = {
    "rqt_ptam::RemotePTAM\0\0updateNamespaceList()\0"
    "index\0onNamespaceChanged(int)\0checked\0"
    "onZoom1(bool)\0onSubscribe(bool)\0"
    "onSpace()\0onReset()\0"
};

void rqt_ptam::RemotePTAM::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        RemotePTAM *_t = static_cast<RemotePTAM *>(_o);
        switch (_id) {
        case 0: _t->updateNamespaceList(); break;
        case 1: _t->onNamespaceChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->onZoom1((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: _t->onSubscribe((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 4: _t->onSpace(); break;
        case 5: _t->onReset(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData rqt_ptam::RemotePTAM::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject rqt_ptam::RemotePTAM::staticMetaObject = {
    { &rqt_gui_cpp::Plugin::staticMetaObject, qt_meta_stringdata_rqt_ptam__RemotePTAM,
      qt_meta_data_rqt_ptam__RemotePTAM, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &rqt_ptam::RemotePTAM::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *rqt_ptam::RemotePTAM::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *rqt_ptam::RemotePTAM::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_rqt_ptam__RemotePTAM))
        return static_cast<void*>(const_cast< RemotePTAM*>(this));
    typedef rqt_gui_cpp::Plugin QMocSuperClass;
    return QMocSuperClass::qt_metacast(_clname);
}

int rqt_ptam::RemotePTAM::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    typedef rqt_gui_cpp::Plugin QMocSuperClass;
    _id = QMocSuperClass::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
