namespace gfl::engine {

struct IReflectionObject {
    template <class T> bool IsKindOf();
    template <class T> T* SafeCast();
};

}  // namespace gfl::engine