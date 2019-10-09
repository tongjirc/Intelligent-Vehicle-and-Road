/********************************************************************************
** Form generated from reading UI file 'remote_ptam.ui'
**
** Created by: Qt User Interface Compiler version 4.8.7
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_REMOTE_PTAM_H
#define UI_REMOTE_PTAM_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QCheckBox>
#include <QtGui/QComboBox>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>
#include "rqt_ptam/ratio_layouted_frame.h"

QT_BEGIN_NAMESPACE

class Ui_RemotePTAMWidget
{
public:
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout;
    QComboBox *topics_combo_box;
    QPushButton *refresh_topics_push_button;
    QPushButton *zoom_1_push_button;
    QCheckBox *subscribe_check_box;
    QPushButton *space_push_button;
    QPushButton *reset_push_button;
    QSpacerItem *horizontalSpacer;
    QHBoxLayout *horizontalLayout_2;
    rqt_ptam::RatioLayoutedFrame *image_frame;
    QSpacerItem *horizontalSpacer_2;
    QSpacerItem *verticalSpacer;

    void setupUi(QWidget *RemotePTAMWidget)
    {
        if (RemotePTAMWidget->objectName().isEmpty())
            RemotePTAMWidget->setObjectName(QString::fromUtf8("RemotePTAMWidget"));
        RemotePTAMWidget->setEnabled(true);
        RemotePTAMWidget->resize(502, 300);
        verticalLayout = new QVBoxLayout(RemotePTAMWidget);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        topics_combo_box = new QComboBox(RemotePTAMWidget);
        topics_combo_box->setObjectName(QString::fromUtf8("topics_combo_box"));
        topics_combo_box->setSizeAdjustPolicy(QComboBox::AdjustToContents);

        horizontalLayout->addWidget(topics_combo_box);

        refresh_topics_push_button = new QPushButton(RemotePTAMWidget);
        refresh_topics_push_button->setObjectName(QString::fromUtf8("refresh_topics_push_button"));

        horizontalLayout->addWidget(refresh_topics_push_button);

        zoom_1_push_button = new QPushButton(RemotePTAMWidget);
        zoom_1_push_button->setObjectName(QString::fromUtf8("zoom_1_push_button"));
        zoom_1_push_button->setEnabled(false);
        zoom_1_push_button->setCheckable(true);

        horizontalLayout->addWidget(zoom_1_push_button);

        subscribe_check_box = new QCheckBox(RemotePTAMWidget);
        subscribe_check_box->setObjectName(QString::fromUtf8("subscribe_check_box"));

        horizontalLayout->addWidget(subscribe_check_box);

        space_push_button = new QPushButton(RemotePTAMWidget);
        space_push_button->setObjectName(QString::fromUtf8("space_push_button"));

        horizontalLayout->addWidget(space_push_button);

        reset_push_button = new QPushButton(RemotePTAMWidget);
        reset_push_button->setObjectName(QString::fromUtf8("reset_push_button"));

        horizontalLayout->addWidget(reset_push_button);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        horizontalLayout->setStretch(6, 1);

        verticalLayout->addLayout(horizontalLayout);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setSpacing(0);
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        image_frame = new rqt_ptam::RatioLayoutedFrame(RemotePTAMWidget);
        image_frame->setObjectName(QString::fromUtf8("image_frame"));
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(image_frame->sizePolicy().hasHeightForWidth());
        image_frame->setSizePolicy(sizePolicy);
        image_frame->setMinimumSize(QSize(80, 60));
        image_frame->setFocusPolicy(Qt::ClickFocus);
        image_frame->setFrameShape(QFrame::Box);
        image_frame->setLineWidth(1);

        horizontalLayout_2->addWidget(image_frame);

        horizontalSpacer_2 = new QSpacerItem(0, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(horizontalSpacer_2);

        horizontalLayout_2->setStretch(0, 1);

        verticalLayout->addLayout(horizontalLayout_2);

        verticalSpacer = new QSpacerItem(20, 0, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout->addItem(verticalSpacer);

        verticalLayout->setStretch(1, 1);

        retranslateUi(RemotePTAMWidget);

        QMetaObject::connectSlotsByName(RemotePTAMWidget);
    } // setupUi

    void retranslateUi(QWidget *RemotePTAMWidget)
    {
        RemotePTAMWidget->setWindowTitle(QApplication::translate("RemotePTAMWidget", "Remote PTAM", 0, QApplication::UnicodeUTF8));
#ifndef QT_NO_TOOLTIP
        subscribe_check_box->setToolTip(QApplication::translate("RemotePTAMWidget", "subscribe to ptam image", 0, QApplication::UnicodeUTF8));
#endif // QT_NO_TOOLTIP
        subscribe_check_box->setText(QString());
#ifndef QT_NO_TOOLTIP
        space_push_button->setToolTip(QApplication::translate("RemotePTAMWidget", "send \"space\" to ptam", 0, QApplication::UnicodeUTF8));
#endif // QT_NO_TOOLTIP
        space_push_button->setText(QApplication::translate("RemotePTAMWidget", "space", 0, QApplication::UnicodeUTF8));
#ifndef QT_NO_TOOLTIP
        reset_push_button->setToolTip(QApplication::translate("RemotePTAMWidget", "resets the map", 0, QApplication::UnicodeUTF8));
#endif // QT_NO_TOOLTIP
        reset_push_button->setText(QApplication::translate("RemotePTAMWidget", "reset", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class RemotePTAMWidget: public Ui_RemotePTAMWidget {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_REMOTE_PTAM_H
