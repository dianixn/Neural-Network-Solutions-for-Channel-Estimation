import numpy as np

## Part 1

batch_size = 20
dimension = 100
num_classes = 10

data = np.random.random([batch_size, dimension]) 
labels = np.random.randint(num_classes, size=[batch_size]) # labels are 0~9

w = np.random.random((dimension,1))
b = 0

def f_forward(x, w, b):
    
    tem = x.dot(w) + b
    tem = sigmoid(tem)
    output = softmax(tem)

    return(output)

def sigmoid(x):
    return(1/(1 + np.exp(-x)))

def softmax(x):
    return np.exp(x) / np.sum(np.exp(x))

def compute_prediction(x):
    return np.argmax(x, axis=1)


def cross_entropy(prediction, labels):
    loss = 0
     
    # Doing cross entropy Loss
    for i in range(len(prediction)):
 
        loss = loss + (-1 * labels[i]*np.log(prediction[i]))
 
    return loss

logits = f_forward(data, w, b) 
loss = cross_entropy(logits, labels)
prediction = compute_prediction(logits) # prediction made by the model
accuracy = (prediction == labels).sum() / batch_size # compute accuracy of the batch

print(logits)
print(loss)
print(prediction)
print(accuracy)

## Part 2

num_steps = 100 #epoch?
lr = 0.1

def back_prop(loss, w, b, lr, x):
    
    w_update = x.transpose().dot(loss)
    b_update = loss
    
    # Updating parameters
    w = w-(lr*(w_update))
    b = b-(lr*(b_update))
     
    return(w, b)

def train(x, w, b, lr, epoch):
    acc =[]
    loss =[]
    for j in range(epoch):
        l =[]
        for i in range(len(x)):
            logits = f_forward(x[i], w, b)
            loss = cross_entropy(logits, labels)
            w, b = back_prop(loss, w, b, lr, x)
        print("epochs:", j + 1, "=== acc:", (1-(sum(l)/len(x)))*100)  
        acc.append((1-(sum(l)/len(x)))*100)
    return(acc, w, b)

acc, w, b = train(data, w, b, lr, epoch = num_steps)

## Part 3

kernel = np.random.random([3, 3])
image = np.random.random([20, 20])

def conv2d_single_channel(image, kernel):
    
    # Zero padding

    assert kernel.shape[0] == kernel.shape[1] and kernel.shape[0] % 2 == 1

    padded_input = np.pad(image,
                          pad_width=kernel.shape[0] // 2,
                          mode='constant',
                          constant_values=0)

    output = np.zeros_like(image)
    for i in range(output.shape[0]):
        for j in range(output.shape[1]):
            for fi in range(kernel.shape[0]):
                for fj in range(kernel.shape[1]):
                    output[i, j] += padded_input[i + fi, j + fj] * kernel[fi, fj]
    return output

Test = conv2d_single_channel(image, kernel)

print(Test)
