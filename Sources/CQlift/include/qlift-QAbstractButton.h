#pragma once

#include "compiler.h"

#ifdef __cplusplus
extern "C" {
#endif

#pragma clang diagnostic ignored "-Wnullability-completeness"

LIBRARY_API CQString QAbstractButton_text(void *abstractButton);
LIBRARY_API void QAbstractButton_setText(void *abstractButton, const char *text);
#pragma clang assume_nonnull begin
LIBRARY_API void QAbstractButton_clicked_connect(void *abstractButton, void *receiver, void (*slot_ptr)(void *, bool));
LIBRARY_API void QAbstractButton_toggled_connect(void *abstractButton, void *receiver, void (*slot_ptr)(void *, bool));
LIBRARY_API void QAbstractButton_pressed_connect(void *abstractButton, void *receiver, void (*slot_ptr)(void *));
LIBRARY_API void QAbstractButton_released_connect(void *abstractButton, void *receiver, void (*slot_ptr)(void *));
#pragma clang assume_nonnull end

LIBRARY_API void QAbstractButton_setIcon(void *abstractButton, void *icon);
LIBRARY_API void QAbstractButton_setIconSize(void *abstractButton, void *size);
LIBRARY_API void QAbstractButton_setCheckable(void *abstractButton, bool checkable);
LIBRARY_API bool QAbstractButton_getCheckable(void *abstractButton);
LIBRARY_API void QAbstractButton_setChecked(void *abstractButton, bool checked);
LIBRARY_API bool QAbstractButton_getChecked(void *abstractButton);
LIBRARY_API void QAbstractButton_setDown(void *abstractButton, bool down);
LIBRARY_API bool QAbstractButton_isDown(void *abstractButton);

#ifdef __cplusplus
}
#endif
