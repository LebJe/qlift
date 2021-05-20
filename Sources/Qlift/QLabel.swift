import CQlift


open class QLabel: QFrame {
    public var alignment: Qt.Alignment = [.AlignLeft, .AlignVCenter] {
        didSet {
            QLabel_setAlignment(self.ptr, alignment.rawValue)
        }
    }

    public var text: String = "" {
        didSet {
            QLabel_setText(self.ptr, text)
        }
    }

    public var scaledContents: Bool {
        get {
            QLabel_hasScaledContents(ptr)
        }
        set {
            QLabel_setScaledContents(ptr, newValue)
        }
    }

    public var openExternalLinks: Bool {
        get {
            QLabel_openExternalLinks(ptr)
        }
        set {
            QLabel_setOpenExternalLinks(ptr, newValue)
        }
    }

    public func setPixmap(_ pixmap: QPixmap) {
        QLabel_setPixmap(ptr, pixmap.ptr)
    }

    public func setImage(_ image: QImage) {
        QLabel_setImage(ptr, image.ptr)
    }

    public init(text: String = "", parent: QWidget? = nil, flags: Qt.WindowFlags = .Widget) {
        self.text = text
        super.init(ptr: QLabel_new(text, parent?.ptr, flags.rawValue), parent: parent)
    }

    override init(ptr: UnsafeMutableRawPointer, parent: QWidget? = nil) {
        super.init(ptr: ptr, parent: parent)
    }

    deinit {
        if self.ptr != nil {
            if QObject_parent(self.ptr) == nil {
                QLabel_delete(self.ptr)
            }
            self.ptr = nil
        }
    }
}

