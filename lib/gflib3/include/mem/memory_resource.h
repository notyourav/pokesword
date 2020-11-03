#include "gflib3/include/core/engine/memory_object.h"

namespace gfl::mem {

// using MemoryResourceBase nn::MemoryResource

struct MemoryResourceBase {

};

struct MemoryResource : MemoryResourceBase, engine::IReflectionObject {
    const char* m_resourceName;
};

}  // namespace gfl::mem