import CQlift

public typealias Slot<QType, Param, RType> = (QType) -> (Param) -> RType
public typealias SlotTwin<QType, Param1, Param2, RType> = (QType) -> (Param1, Param2) -> RType
public typealias SlotVoid<QType, RType> = (QType) -> () -> RType

open class QObject {
    var ptr: UnsafeMutableRawPointer!
    private var connection_destroy: UnsafeMutableRawPointer?

    public init(parent: QObject? = nil) {
        self.ptr = QObject_new(parent?.ptr)
        let rawSelf = Unmanaged.passUnretained(self).toOpaque()
        QObject_setSwiftObject(ptr, rawSelf)

        connection_destroy = QObject_destroyed_connect(self.ptr, self.ptr, rawSelf) { raw in
            let _self = Unmanaged<QObject>.fromOpaque(raw).takeUnretainedValue()
            _self.swiftCleanup()
        }
    }

    init(ptr: UnsafeMutableRawPointer) {
        self.ptr = ptr
        let rawSelf = Unmanaged.passUnretained(self).toOpaque()
        QObject_setSwiftObject(ptr, rawSelf)

        connection_destroy = QObject_destroyed_connect(self.ptr, self.ptr, rawSelf) { raw in
            let _self = Unmanaged<QObject>.fromOpaque(raw).takeUnretainedValue()
            _self.swiftCleanup()
        }
    }

    deinit {
        checkDeleteQtObj()
    }

    func swiftCleanup() {
        ptr = nil
    }
    
    func checkDeleteQtObj() {
        if self.ptr != nil {
            QObject_clearSwiftObject(self.ptr)
            QObject_destroyed_disconnect(connection_destroy)
            if QObject_parent(ptr) == nil {
                QObject_delete(self.ptr)
            }
            self.ptr = nil
        }
    }

    public var objectName: String {
        get {
            let s = QObject_objectName(ptr)
            return String(utf16CodeUnits: s.utf16, count: Int(s.size))
        }
        set {
            QObject_setObjectName(ptr, newValue)
        }
    }

    public var parent: QObject? {
        get {
            guard let parentPtr = QObject_parent(ptr) else {
                return nil
            }
            return QObject.swiftQObject(from: parentPtr)
        }
        set { QObject_setParent(ptr, newValue?.ptr) }
    }

    public func dumpObjectInfo() {
        QObject_dumpObjectInfo(ptr)
    }

    public func dumpObjectTree() {
        QObject_dumpObjectTree(ptr)
    }
    
    public func deleteLater() {
        QObject_deleteLater(ptr)
    }

    static public func swiftQObject(from ptr: UnsafeMutableRawPointer) -> QObject? {
        guard let raw = QObject_getSwiftObject(ptr) else { return nil }
        return Unmanaged<QObject>.fromOpaque(raw).takeUnretainedValue()
    }

    static public func swiftObject<T: QObject>(from ptr: UnsafeMutableRawPointer, ofType: T.Type) -> T? {
        guard let raw = QObject_getSwiftObject(ptr) else { return nil }
        return Unmanaged<T>.fromOpaque(raw).takeUnretainedValue()
    }
}
