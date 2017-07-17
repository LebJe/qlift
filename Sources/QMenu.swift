import CQlift


open class QMenu: QWidget {
    public init(title: String? = nil, parent: QWidget? = nil) {
        super.init(ptr: QMenu_new(title, parent?.ptr))
    }

    override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        if self.ptr != nil {
            if QObject_parent(self.ptr) != nil {
                QMenu_delete(self.ptr)
                self.ptr = nil
            }
        }
    }
}
