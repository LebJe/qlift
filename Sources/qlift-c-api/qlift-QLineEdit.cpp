#include <QLineEdit>

#ifndef SWIFT_PACKAGE
#include <wobjectimpl.h>
#else
#include "../../include/wobjectimpl.h"
#endif

#include "qlift-QLineEdit.h"

/*
void* QLineEdit_new(const char *contents, void *parent);
void QLineEdit_setPlaceholderText(void *lineEdit, const char *text);
void QLineEdit_textEditedEvent_Override(void *lineEdit, void *context, void (*mousePressEvent_Functor)(void*, void*));
*/

[[maybe_unused]] void* QLineEdit_new(const char *contents, void *parent) {
    return static_cast<void*>(new QliftLineEdit { contents, static_cast<QWidget*>(parent) });
}

[[maybe_unused]] void QLineEdit_setPlaceholderText(void *lineEdit, const char *text) {
    static_cast<QLineEdit*>(lineEdit)->setPlaceholderText(text);
}

[[maybe_unused]] void QLineEdit_setText(void *lineEdit, const char *text) {
    static_cast<QLineEdit*>(lineEdit)->setText(text);
}

[[maybe_unused]] const ushort* QLineEdit_text(void *lineEdit, int *len) {
    auto text = static_cast<QLineEdit*>(lineEdit)->text();
    *len = text.size();
    return text.utf16();
}

[[maybe_unused]] const ushort* QLineEdit_placeholderText(void *lineEdit, int *len) {
    auto text = static_cast<QLineEdit*>(lineEdit)->placeholderText();
    *len = text.size();
    return text.utf16();
}

[[maybe_unused]] const ushort* QLineEdit_selectedText(void *lineEdit, int *len) {
    auto text = static_cast<QLineEdit*>(lineEdit)->selectedText();
    *len = text.size();
    return text.utf16();
}


[[maybe_unused]] void QLineEdit_textChanged_connect(void *lineEdit, void *receiver, void *context, void (*slot_ptr)(void*)) {
    QObject::connect(
        static_cast<QLineEdit*>(lineEdit),
        &QLineEdit::textChanged,
        static_cast<QObject*>(receiver),
        [context, slot_ptr]() {
            (*slot_ptr)(context);
        }
    );
}

W_OBJECT_IMPL(QliftLineEdit)

QliftLineEdit::~QliftLineEdit() {
}

