import os

for root, dirs, files in os.walk('./'):
    for file in files:
        if file.endswith('.bak'):
            print(os.path.join(root, file))
            #os.remove(os.path.join(root, file))
