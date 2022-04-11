export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libmkl_def.so:/usr/lib/x86_64-linux-gnu/libmkl_avx2.so:/usr/lib/x86_64-linux-gnu/libmkl_core.so:/usr/lib/x86_64-linux-gnu/libmkl_intel_lp64.so:/usr/lib/x86_64-linux-gnu/libmkl_intel_thread.so:/usr/lib/x86_64-linux-gnu/libiomp5.so

source ../utils/venv-test/bin/activate
# cd ../utils/faiss/

# rm -r build

## cpu build ##
cmake -B build -DFAISS_ENABLE_GPU=OFF .

## gpu build ##
cmake -B build -DCMAKE_CUDA_ARCHITECTURES="86" .

## compile ##
make -C build -j faiss
make -C build -j swigfaiss
# make -C build test

## install to env ##
pip install ./build/faiss/python/
