/****************************************************************************
** Meta object code from reading C++ file 'ratio_layouted_frame.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.7)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../src/ethzasl_ptam/rqt_ptam/include/rqt_ptam/ratio_layouted_frame.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ratio_layouted_frame.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.7. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_rqt_ptam__RatioLayoutedFrame[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_rqt_ptam__RatioLayoutedFrame[] = {
    "rqt_ptam::RatioLayoutedFrame\0"
};

void rqt_ptam::RatioLayoutedFrame::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData rqt_ptam::RatioLayoutedFrame::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject rqt_ptam::RatioLayoutedFrame::staticMetaObject = {
    { &QFrame::staticMetaObject, qt_meta_stringdata_rqt_ptam__RatioLayoutedFrame,
      qt_meta_data_rqt_ptam__RatioLayoutedFrame, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &rqt_ptam::RatioLayoutedFrame::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *rqt_ptam::RatioLayoutedFrame::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *rqt_ptam::RatioLayoutedFrame::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_rqt_ptam__RatioLayoutedFrame))
        return static_cast<void*>(const_cast< RatioLayoutedFrame*>(this));
    return QFrame::qt_metacast(_clname);
}

int rqt_ptam::RatioLayoutedFrame::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QFrame::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
