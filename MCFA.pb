node {
  name: "mn_input_y"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 2
        }
      }
    }
  }
}
node {
  name: "dropout_keep_prob"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
}
node {
  name: "is_training"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "en_input_x"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 71
        }
      }
    }
  }
}
node {
  name: "embed/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "pJ\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "embed/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "embed/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "embed/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "embed/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 7
    }
  }
}
node {
  name: "embed/random_uniform/sub"
  op: "Sub"
  input: "embed/random_uniform/max"
  input: "embed/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "embed/random_uniform/mul"
  op: "Mul"
  input: "embed/random_uniform/RandomUniform"
  input: "embed/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "embed/random_uniform"
  op: "Add"
  input: "embed/random_uniform/mul"
  input: "embed/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "embed/en_embedding"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19056
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "embed/en_embedding/Assign"
  op: "Assign"
  input: "embed/en_embedding"
  input: "embed/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "embed/en_embedding/read"
  op: "Identity"
  input: "embed/en_embedding"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
}
node {
  name: "embed/embedding_lookup/axis"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "embed/embedding_lookup"
  op: "GatherV2"
  input: "embed/en_embedding/read"
  input: "en_input_x"
  input: "embed/embedding_lookup/axis"
  attr {
    key: "Taxis"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "batch_dims"
    value {
      i: 0
    }
  }
}
node {
  name: "embed/embedding_lookup/Identity"
  op: "Identity"
  input: "embed/embedding_lookup"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Cast/x"
  op: "Pack"
  input: "embed/embedding_lookup/Identity"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\003\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "transpose"
  op: "Transpose"
  input: "Cast/x"
  input: "transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-0/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-0/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "conv-maxpool-0/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "conv-maxpool-0/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 23
    }
  }
}
node {
  name: "conv-maxpool-0/truncated_normal/mul"
  op: "Mul"
  input: "conv-maxpool-0/truncated_normal/TruncatedNormal"
  input: "conv-maxpool-0/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-0/truncated_normal"
  op: "Add"
  input: "conv-maxpool-0/truncated_normal/mul"
  input: "conv-maxpool-0/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-0/en_W"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Assign"
  op: "Assign"
  input: "conv-maxpool-0/en_W"
  input: "conv-maxpool-0/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/read"
  op: "Identity"
  input: "conv-maxpool-0/en_W"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-0/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0/en_b"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0/en_b/Assign"
  op: "Assign"
  input: "conv-maxpool-0/en_b"
  input: "conv-maxpool-0/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0/en_b/read"
  op: "Identity"
  input: "conv-maxpool-0/en_b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-0/conv"
  op: "Conv2D"
  input: "transpose"
  input: "conv-maxpool-0/en_W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0/BiasAdd"
  op: "BiasAdd"
  input: "conv-maxpool-0/conv"
  input: "conv-maxpool-0/en_b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv-maxpool-0/en_relu"
  op: "Relu"
  input: "conv-maxpool-0/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-0/en_pool"
  op: "MaxPool"
  input: "conv-maxpool-0/en_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 69
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "conv-maxpool-1/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-1/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "conv-maxpool-1/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "conv-maxpool-1/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 40
    }
  }
}
node {
  name: "conv-maxpool-1/truncated_normal/mul"
  op: "Mul"
  input: "conv-maxpool-1/truncated_normal/TruncatedNormal"
  input: "conv-maxpool-1/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-1/truncated_normal"
  op: "Add"
  input: "conv-maxpool-1/truncated_normal/mul"
  input: "conv-maxpool-1/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-1/en_W"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Assign"
  op: "Assign"
  input: "conv-maxpool-1/en_W"
  input: "conv-maxpool-1/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/read"
  op: "Identity"
  input: "conv-maxpool-1/en_W"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1/en_b"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1/en_b/Assign"
  op: "Assign"
  input: "conv-maxpool-1/en_b"
  input: "conv-maxpool-1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1/en_b/read"
  op: "Identity"
  input: "conv-maxpool-1/en_b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-1/conv"
  op: "Conv2D"
  input: "transpose"
  input: "conv-maxpool-1/en_W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1/BiasAdd"
  op: "BiasAdd"
  input: "conv-maxpool-1/conv"
  input: "conv-maxpool-1/en_b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv-maxpool-1/en_relu"
  op: "Relu"
  input: "conv-maxpool-1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-1/en_pool"
  op: "MaxPool"
  input: "conv-maxpool-1/en_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 68
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "conv-maxpool-2/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-2/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "conv-maxpool-2/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "conv-maxpool-2/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 57
    }
  }
}
node {
  name: "conv-maxpool-2/truncated_normal/mul"
  op: "Mul"
  input: "conv-maxpool-2/truncated_normal/TruncatedNormal"
  input: "conv-maxpool-2/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-2/truncated_normal"
  op: "Add"
  input: "conv-maxpool-2/truncated_normal/mul"
  input: "conv-maxpool-2/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-2/en_W"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Assign"
  op: "Assign"
  input: "conv-maxpool-2/en_W"
  input: "conv-maxpool-2/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/read"
  op: "Identity"
  input: "conv-maxpool-2/en_W"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2/en_b"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2/en_b/Assign"
  op: "Assign"
  input: "conv-maxpool-2/en_b"
  input: "conv-maxpool-2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2/en_b/read"
  op: "Identity"
  input: "conv-maxpool-2/en_b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-2/conv"
  op: "Conv2D"
  input: "transpose"
  input: "conv-maxpool-2/en_W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2/BiasAdd"
  op: "BiasAdd"
  input: "conv-maxpool-2/conv"
  input: "conv-maxpool-2/en_b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv-maxpool-2/en_relu"
  op: "Relu"
  input: "conv-maxpool-2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-2/en_pool"
  op: "MaxPool"
  input: "conv-maxpool-2/en_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 67
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "concat"
  op: "ConcatV2"
  input: "conv-maxpool-0/en_pool"
  input: "conv-maxpool-1/en_pool"
  input: "conv-maxpool-2/en_pool"
  input: "concat/axis"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377,\001\000\000"
      }
    }
  }
}
node {
  name: "Reshape"
  op: "Reshape"
  input: "concat"
  input: "Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout/sub"
  op: "Sub"
  input: "dropout/sub/x"
  input: "dropout_keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/en_h_drop/Shape"
  op: "Shape"
  input: "Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout/en_h_drop/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout/en_h_drop/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout/en_h_drop/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout/en_h_drop/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 80
    }
  }
}
node {
  name: "dropout/en_h_drop/random_uniform/sub"
  op: "Sub"
  input: "dropout/en_h_drop/random_uniform/max"
  input: "dropout/en_h_drop/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/en_h_drop/random_uniform/mul"
  op: "Mul"
  input: "dropout/en_h_drop/random_uniform/RandomUniform"
  input: "dropout/en_h_drop/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/en_h_drop/random_uniform"
  op: "Add"
  input: "dropout/en_h_drop/random_uniform/mul"
  input: "dropout/en_h_drop/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/en_h_drop/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout/en_h_drop/sub"
  op: "Sub"
  input: "dropout/en_h_drop/sub/x"
  input: "dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/en_h_drop/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout/en_h_drop/truediv"
  op: "RealDiv"
  input: "dropout/en_h_drop/truediv/x"
  input: "dropout/en_h_drop/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/en_h_drop/GreaterEqual"
  op: "GreaterEqual"
  input: "dropout/en_h_drop/random_uniform"
  input: "dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/en_h_drop/mul"
  op: "Mul"
  input: "Reshape"
  input: "dropout/en_h_drop/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout/en_h_drop/Cast"
  op: "Cast"
  input: "dropout/en_h_drop/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "dropout/en_h_drop/mul_1"
  op: "Mul"
  input: "dropout/en_h_drop/mul"
  input: "dropout/en_h_drop/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mn_input_x"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 67
        }
      }
    }
  }
}
node {
  name: "embed_1/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\217K\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "embed_1/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "embed_1/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "embed_1/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "embed_1/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 96
    }
  }
}
node {
  name: "embed_1/random_uniform/sub"
  op: "Sub"
  input: "embed_1/random_uniform/max"
  input: "embed_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "embed_1/random_uniform/mul"
  op: "Mul"
  input: "embed_1/random_uniform/RandomUniform"
  input: "embed_1/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "embed_1/random_uniform"
  op: "Add"
  input: "embed_1/random_uniform/mul"
  input: "embed_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "embed_1/mn_embedding"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19343
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "embed_1/mn_embedding/Assign"
  op: "Assign"
  input: "embed_1/mn_embedding"
  input: "embed_1/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "embed_1/mn_embedding/read"
  op: "Identity"
  input: "embed_1/mn_embedding"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
}
node {
  name: "embed_1/embedding_lookup/axis"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "embed_1/embedding_lookup"
  op: "GatherV2"
  input: "embed_1/mn_embedding/read"
  input: "mn_input_x"
  input: "embed_1/embedding_lookup/axis"
  attr {
    key: "Taxis"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "batch_dims"
    value {
      i: 0
    }
  }
}
node {
  name: "embed_1/embedding_lookup/Identity"
  op: "Identity"
  input: "embed_1/embedding_lookup"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Cast_1/x"
  op: "Pack"
  input: "embed_1/embedding_lookup/Identity"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\003\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_1"
  op: "Transpose"
  input: "Cast_1/x"
  input: "transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-0_1/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "conv-maxpool-0_1/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 112
    }
  }
}
node {
  name: "conv-maxpool-0_1/truncated_normal/mul"
  op: "Mul"
  input: "conv-maxpool-0_1/truncated_normal/TruncatedNormal"
  input: "conv-maxpool-0_1/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-0_1/truncated_normal"
  op: "Add"
  input: "conv-maxpool-0_1/truncated_normal/mul"
  input: "conv-maxpool-0_1/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Assign"
  op: "Assign"
  input: "conv-maxpool-0_1/mn_W"
  input: "conv-maxpool-0_1/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/read"
  op: "Identity"
  input: "conv-maxpool-0_1/mn_W"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_b"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_b/Assign"
  op: "Assign"
  input: "conv-maxpool-0_1/mn_b"
  input: "conv-maxpool-0_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_b/read"
  op: "Identity"
  input: "conv-maxpool-0_1/mn_b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/conv"
  op: "Conv2D"
  input: "transpose_1"
  input: "conv-maxpool-0_1/mn_W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0_1/BiasAdd"
  op: "BiasAdd"
  input: "conv-maxpool-0_1/conv"
  input: "conv-maxpool-0_1/mn_b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_relu"
  op: "Relu"
  input: "conv-maxpool-0_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_pool"
  op: "MaxPool"
  input: "conv-maxpool-0_1/mn_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 65
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "conv-maxpool-1_1/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 129
    }
  }
}
node {
  name: "conv-maxpool-1_1/truncated_normal/mul"
  op: "Mul"
  input: "conv-maxpool-1_1/truncated_normal/TruncatedNormal"
  input: "conv-maxpool-1_1/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-1_1/truncated_normal"
  op: "Add"
  input: "conv-maxpool-1_1/truncated_normal/mul"
  input: "conv-maxpool-1_1/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Assign"
  op: "Assign"
  input: "conv-maxpool-1_1/mn_W"
  input: "conv-maxpool-1_1/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/read"
  op: "Identity"
  input: "conv-maxpool-1_1/mn_W"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_b"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_b/Assign"
  op: "Assign"
  input: "conv-maxpool-1_1/mn_b"
  input: "conv-maxpool-1_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_b/read"
  op: "Identity"
  input: "conv-maxpool-1_1/mn_b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/conv"
  op: "Conv2D"
  input: "transpose_1"
  input: "conv-maxpool-1_1/mn_W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1_1/BiasAdd"
  op: "BiasAdd"
  input: "conv-maxpool-1_1/conv"
  input: "conv-maxpool-1_1/mn_b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_relu"
  op: "Relu"
  input: "conv-maxpool-1_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_pool"
  op: "MaxPool"
  input: "conv-maxpool-1_1/mn_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 64
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "conv-maxpool-2_1/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 146
    }
  }
}
node {
  name: "conv-maxpool-2_1/truncated_normal/mul"
  op: "Mul"
  input: "conv-maxpool-2_1/truncated_normal/TruncatedNormal"
  input: "conv-maxpool-2_1/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-2_1/truncated_normal"
  op: "Add"
  input: "conv-maxpool-2_1/truncated_normal/mul"
  input: "conv-maxpool-2_1/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Assign"
  op: "Assign"
  input: "conv-maxpool-2_1/mn_W"
  input: "conv-maxpool-2_1/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/read"
  op: "Identity"
  input: "conv-maxpool-2_1/mn_W"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_b"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_b/Assign"
  op: "Assign"
  input: "conv-maxpool-2_1/mn_b"
  input: "conv-maxpool-2_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_b/read"
  op: "Identity"
  input: "conv-maxpool-2_1/mn_b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/conv"
  op: "Conv2D"
  input: "transpose_1"
  input: "conv-maxpool-2_1/mn_W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2_1/BiasAdd"
  op: "BiasAdd"
  input: "conv-maxpool-2_1/conv"
  input: "conv-maxpool-2_1/mn_b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_relu"
  op: "Relu"
  input: "conv-maxpool-2_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_pool"
  op: "MaxPool"
  input: "conv-maxpool-2_1/mn_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 63
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "concat_1"
  op: "ConcatV2"
  input: "conv-maxpool-0_1/mn_pool"
  input: "conv-maxpool-1_1/mn_pool"
  input: "conv-maxpool-2_1/mn_pool"
  input: "concat_1/axis"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377,\001\000\000"
      }
    }
  }
}
node {
  name: "Reshape_1"
  op: "Reshape"
  input: "concat_1"
  input: "Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_1/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/sub"
  op: "Sub"
  input: "dropout_1/sub/x"
  input: "dropout_keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/Shape"
  op: "Shape"
  input: "Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_1/mn_h_drop/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 169
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/random_uniform/sub"
  op: "Sub"
  input: "dropout_1/mn_h_drop/random_uniform/max"
  input: "dropout_1/mn_h_drop/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/random_uniform/mul"
  op: "Mul"
  input: "dropout_1/mn_h_drop/random_uniform/RandomUniform"
  input: "dropout_1/mn_h_drop/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/random_uniform"
  op: "Add"
  input: "dropout_1/mn_h_drop/random_uniform/mul"
  input: "dropout_1/mn_h_drop/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/sub"
  op: "Sub"
  input: "dropout_1/mn_h_drop/sub/x"
  input: "dropout_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/truediv"
  op: "RealDiv"
  input: "dropout_1/mn_h_drop/truediv/x"
  input: "dropout_1/mn_h_drop/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/GreaterEqual"
  op: "GreaterEqual"
  input: "dropout_1/mn_h_drop/random_uniform"
  input: "dropout_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/mul"
  op: "Mul"
  input: "Reshape_1"
  input: "dropout_1/mn_h_drop/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/Cast"
  op: "Cast"
  input: "dropout_1/mn_h_drop/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "dropout_1/mn_h_drop/mul_1"
  op: "Mul"
  input: "dropout_1/mn_h_drop/mul"
  input: "dropout_1/mn_h_drop/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "W/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "X\002\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "W/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.09983374923467636
      }
    }
  }
}
node {
  name: "W/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.09983374923467636
      }
    }
  }
}
node {
  name: "W/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "W/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 184
    }
  }
}
node {
  name: "W/Initializer/random_uniform/sub"
  op: "Sub"
  input: "W/Initializer/random_uniform/max"
  input: "W/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
}
node {
  name: "W/Initializer/random_uniform/mul"
  op: "Mul"
  input: "W/Initializer/random_uniform/RandomUniform"
  input: "W/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
}
node {
  name: "W/Initializer/random_uniform"
  op: "Add"
  input: "W/Initializer/random_uniform/mul"
  input: "W/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
}
node {
  name: "W"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 600
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "W/Assign"
  op: "Assign"
  input: "W"
  input: "W/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "W/read"
  op: "Identity"
  input: "W"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
}
node {
  name: "Xen0/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Xen0/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "Xen0/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "Xen0/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Xen0/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 194
    }
  }
}
node {
  name: "Xen0/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Xen0/Initializer/random_uniform/max"
  input: "Xen0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
}
node {
  name: "Xen0/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Xen0/Initializer/random_uniform/RandomUniform"
  input: "Xen0/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
}
node {
  name: "Xen0/Initializer/random_uniform"
  op: "Add"
  input: "Xen0/Initializer/random_uniform/mul"
  input: "Xen0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
}
node {
  name: "Xen0"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Xen0/Assign"
  op: "Assign"
  input: "Xen0"
  input: "Xen0/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Xen0/read"
  op: "Identity"
  input: "Xen0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
}
node {
  name: "Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Assign"
  op: "Assign"
  input: "Variable"
  input: "Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/read"
  op: "Identity"
  input: "Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "xen0_1/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "xen0_1/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14118623733520508
      }
    }
  }
}
node {
  name: "xen0_1/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14118623733520508
      }
    }
  }
}
node {
  name: "xen0_1/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "xen0_1/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 208
    }
  }
}
node {
  name: "xen0_1/Initializer/random_uniform/sub"
  op: "Sub"
  input: "xen0_1/Initializer/random_uniform/max"
  input: "xen0_1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
}
node {
  name: "xen0_1/Initializer/random_uniform/mul"
  op: "Mul"
  input: "xen0_1/Initializer/random_uniform/RandomUniform"
  input: "xen0_1/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
}
node {
  name: "xen0_1/Initializer/random_uniform"
  op: "Add"
  input: "xen0_1/Initializer/random_uniform/mul"
  input: "xen0_1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
}
node {
  name: "xen0_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "xen0_1/Assign"
  op: "Assign"
  input: "xen0_1"
  input: "xen0_1/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "xen0_1/read"
  op: "Identity"
  input: "xen0_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
}
node {
  name: "Ven0/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "X\002\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Ven0/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.08164966106414795
      }
    }
  }
}
node {
  name: "Ven0/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.08164966106414795
      }
    }
  }
}
node {
  name: "Ven0/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Ven0/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 218
    }
  }
}
node {
  name: "Ven0/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Ven0/Initializer/random_uniform/max"
  input: "Ven0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
}
node {
  name: "Ven0/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Ven0/Initializer/random_uniform/RandomUniform"
  input: "Ven0/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
}
node {
  name: "Ven0/Initializer/random_uniform"
  op: "Add"
  input: "Ven0/Initializer/random_uniform/mul"
  input: "Ven0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
}
node {
  name: "Ven0"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 600
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Ven0/Assign"
  op: "Assign"
  input: "Ven0"
  input: "Ven0/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Ven0/read"
  op: "Identity"
  input: "Ven0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
}
node {
  name: "Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Assign"
  op: "Assign"
  input: "Variable_1"
  input: "Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/read"
  op: "Identity"
  input: "Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "Uen0/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Uen0/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "Uen0/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "Uen0/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Uen0/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 232
    }
  }
}
node {
  name: "Uen0/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Uen0/Initializer/random_uniform/max"
  input: "Uen0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
}
node {
  name: "Uen0/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Uen0/Initializer/random_uniform/RandomUniform"
  input: "Uen0/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
}
node {
  name: "Uen0/Initializer/random_uniform"
  op: "Add"
  input: "Uen0/Initializer/random_uniform/mul"
  input: "Uen0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
}
node {
  name: "Uen0"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Uen0/Assign"
  op: "Assign"
  input: "Uen0"
  input: "Uen0/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Uen0/read"
  op: "Identity"
  input: "Uen0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
}
node {
  name: "Xmn0/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Xmn0/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "Xmn0/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "Xmn0/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Xmn0/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 242
    }
  }
}
node {
  name: "Xmn0/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Xmn0/Initializer/random_uniform/max"
  input: "Xmn0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
}
node {
  name: "Xmn0/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Xmn0/Initializer/random_uniform/RandomUniform"
  input: "Xmn0/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
}
node {
  name: "Xmn0/Initializer/random_uniform"
  op: "Add"
  input: "Xmn0/Initializer/random_uniform/mul"
  input: "Xmn0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
}
node {
  name: "Xmn0"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Xmn0/Assign"
  op: "Assign"
  input: "Xmn0"
  input: "Xmn0/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Xmn0/read"
  op: "Identity"
  input: "Xmn0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
}
node {
  name: "Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_2"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_2/Assign"
  op: "Assign"
  input: "Variable_2"
  input: "Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_2/read"
  op: "Identity"
  input: "Variable_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
}
node {
  name: "xmn0_1/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "xmn0_1/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14118623733520508
      }
    }
  }
}
node {
  name: "xmn0_1/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14118623733520508
      }
    }
  }
}
node {
  name: "xmn0_1/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "xmn0_1/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 256
    }
  }
}
node {
  name: "xmn0_1/Initializer/random_uniform/sub"
  op: "Sub"
  input: "xmn0_1/Initializer/random_uniform/max"
  input: "xmn0_1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
}
node {
  name: "xmn0_1/Initializer/random_uniform/mul"
  op: "Mul"
  input: "xmn0_1/Initializer/random_uniform/RandomUniform"
  input: "xmn0_1/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
}
node {
  name: "xmn0_1/Initializer/random_uniform"
  op: "Add"
  input: "xmn0_1/Initializer/random_uniform/mul"
  input: "xmn0_1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
}
node {
  name: "xmn0_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "xmn0_1/Assign"
  op: "Assign"
  input: "xmn0_1"
  input: "xmn0_1/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "xmn0_1/read"
  op: "Identity"
  input: "xmn0_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
}
node {
  name: "Vmn0/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "X\002\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Vmn0/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.08164966106414795
      }
    }
  }
}
node {
  name: "Vmn0/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.08164966106414795
      }
    }
  }
}
node {
  name: "Vmn0/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Vmn0/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 266
    }
  }
}
node {
  name: "Vmn0/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Vmn0/Initializer/random_uniform/max"
  input: "Vmn0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
}
node {
  name: "Vmn0/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Vmn0/Initializer/random_uniform/RandomUniform"
  input: "Vmn0/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
}
node {
  name: "Vmn0/Initializer/random_uniform"
  op: "Add"
  input: "Vmn0/Initializer/random_uniform/mul"
  input: "Vmn0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
}
node {
  name: "Vmn0"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 600
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Vmn0/Assign"
  op: "Assign"
  input: "Vmn0"
  input: "Vmn0/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Vmn0/read"
  op: "Identity"
  input: "Vmn0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
}
node {
  name: "Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_3"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_3/Assign"
  op: "Assign"
  input: "Variable_3"
  input: "Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_3/read"
  op: "Identity"
  input: "Variable_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
}
node {
  name: "Umn0/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Umn0/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "Umn0/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "Umn0/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Umn0/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 280
    }
  }
}
node {
  name: "Umn0/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Umn0/Initializer/random_uniform/max"
  input: "Umn0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
}
node {
  name: "Umn0/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Umn0/Initializer/random_uniform/RandomUniform"
  input: "Umn0/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
}
node {
  name: "Umn0/Initializer/random_uniform"
  op: "Add"
  input: "Umn0/Initializer/random_uniform/mul"
  input: "Umn0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
}
node {
  name: "Umn0"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Umn0/Assign"
  op: "Assign"
  input: "Umn0"
  input: "Umn0/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Umn0/read"
  op: "Identity"
  input: "Umn0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
}
node {
  name: "Ten/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Ten/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14118623733520508
      }
    }
  }
}
node {
  name: "Ten/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14118623733520508
      }
    }
  }
}
node {
  name: "Ten/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Ten/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 290
    }
  }
}
node {
  name: "Ten/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Ten/Initializer/random_uniform/max"
  input: "Ten/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
}
node {
  name: "Ten/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Ten/Initializer/random_uniform/RandomUniform"
  input: "Ten/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
}
node {
  name: "Ten/Initializer/random_uniform"
  op: "Add"
  input: "Ten/Initializer/random_uniform/mul"
  input: "Ten/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
}
node {
  name: "Ten"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Ten/Assign"
  op: "Assign"
  input: "Ten"
  input: "Ten/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Ten/read"
  op: "Identity"
  input: "Ten"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
}
node {
  name: "Tmn/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Tmn/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14118623733520508
      }
    }
  }
}
node {
  name: "Tmn/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14118623733520508
      }
    }
  }
}
node {
  name: "Tmn/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Tmn/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 300
    }
  }
}
node {
  name: "Tmn/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Tmn/Initializer/random_uniform/max"
  input: "Tmn/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
}
node {
  name: "Tmn/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Tmn/Initializer/random_uniform/RandomUniform"
  input: "Tmn/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
}
node {
  name: "Tmn/Initializer/random_uniform"
  op: "Add"
  input: "Tmn/Initializer/random_uniform/mul"
  input: "Tmn/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
}
node {
  name: "Tmn"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Tmn/Assign"
  op: "Assign"
  input: "Tmn"
  input: "Tmn/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Tmn/read"
  op: "Identity"
  input: "Tmn"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
}
node {
  name: "MatMul"
  op: "MatMul"
  input: "dropout/en_h_drop/mul_1"
  input: "Ten/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "Sigmoid"
  op: "Sigmoid"
  input: "MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "sub"
  op: "Sub"
  input: "sub/x"
  input: "dropout_keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/Shape"
  op: "Shape"
  input: "Sigmoid"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_2/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_2/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_2/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 314
    }
  }
}
node {
  name: "dropout_2/random_uniform/sub"
  op: "Sub"
  input: "dropout_2/random_uniform/max"
  input: "dropout_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/random_uniform/mul"
  op: "Mul"
  input: "dropout_2/random_uniform/RandomUniform"
  input: "dropout_2/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/random_uniform"
  op: "Add"
  input: "dropout_2/random_uniform/mul"
  input: "dropout_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/sub"
  op: "Sub"
  input: "dropout_2/sub/x"
  input: "sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/truediv"
  op: "RealDiv"
  input: "dropout_2/truediv/x"
  input: "dropout_2/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/GreaterEqual"
  op: "GreaterEqual"
  input: "dropout_2/random_uniform"
  input: "sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/mul"
  op: "Mul"
  input: "Sigmoid"
  input: "dropout_2/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/Cast"
  op: "Cast"
  input: "dropout_2/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "dropout_2/mul_1"
  op: "Mul"
  input: "dropout_2/mul"
  input: "dropout_2/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MatMul_1"
  op: "MatMul"
  input: "dropout_1/mn_h_drop/mul_1"
  input: "Tmn/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "Sigmoid_1"
  op: "Sigmoid"
  input: "MatMul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "sub_1"
  op: "Sub"
  input: "sub_1/x"
  input: "dropout_keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/Shape"
  op: "Shape"
  input: "Sigmoid_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_3/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_3/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_3/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_3/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 333
    }
  }
}
node {
  name: "dropout_3/random_uniform/sub"
  op: "Sub"
  input: "dropout_3/random_uniform/max"
  input: "dropout_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/random_uniform/mul"
  op: "Mul"
  input: "dropout_3/random_uniform/RandomUniform"
  input: "dropout_3/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/random_uniform"
  op: "Add"
  input: "dropout_3/random_uniform/mul"
  input: "dropout_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_3/sub"
  op: "Sub"
  input: "dropout_3/sub/x"
  input: "sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_3/truediv"
  op: "RealDiv"
  input: "dropout_3/truediv/x"
  input: "dropout_3/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/GreaterEqual"
  op: "GreaterEqual"
  input: "dropout_3/random_uniform"
  input: "sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/mul"
  op: "Mul"
  input: "Sigmoid_1"
  input: "dropout_3/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_3/Cast"
  op: "Cast"
  input: "dropout_3/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "dropout_3/mul_1"
  op: "Mul"
  input: "dropout_3/mul"
  input: "dropout_3/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MatMul_2"
  op: "MatMul"
  input: "dropout/en_h_drop/mul_1"
  input: "Xen0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "MatMul_3"
  op: "MatMul"
  input: "dropout/en_h_drop/mul_1"
  input: "Uen0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "MatMul_4"
  op: "MatMul"
  input: "dropout_1/mn_h_drop/mul_1"
  input: "Xmn0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "MatMul_5"
  op: "MatMul"
  input: "dropout_1/mn_h_drop/mul_1"
  input: "Umn0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "mul"
  op: "Mul"
  input: "MatMul_2"
  input: "dropout_2/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "add"
  op: "Add"
  input: "MatMul_2"
  input: "mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "add_1"
  op: "Add"
  input: "add"
  input: "Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Tanh"
  op: "Tanh"
  input: "add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub_2/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "sub_2"
  op: "Sub"
  input: "sub_2/x"
  input: "dropout_keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_4/Shape"
  op: "Shape"
  input: "Tanh"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_4/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_4/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_4/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_4/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 358
    }
  }
}
node {
  name: "dropout_4/random_uniform/sub"
  op: "Sub"
  input: "dropout_4/random_uniform/max"
  input: "dropout_4/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_4/random_uniform/mul"
  op: "Mul"
  input: "dropout_4/random_uniform/RandomUniform"
  input: "dropout_4/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_4/random_uniform"
  op: "Add"
  input: "dropout_4/random_uniform/mul"
  input: "dropout_4/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_4/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_4/sub"
  op: "Sub"
  input: "dropout_4/sub/x"
  input: "sub_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_4/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_4/truediv"
  op: "RealDiv"
  input: "dropout_4/truediv/x"
  input: "dropout_4/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_4/GreaterEqual"
  op: "GreaterEqual"
  input: "dropout_4/random_uniform"
  input: "sub_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_4/mul"
  op: "Mul"
  input: "Tanh"
  input: "dropout_4/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_4/Cast"
  op: "Cast"
  input: "dropout_4/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "dropout_4/mul_1"
  op: "Mul"
  input: "dropout_4/mul"
  input: "dropout_4/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MatMul_6"
  op: "MatMul"
  input: "dropout_4/mul_1"
  input: "xen0_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "mul_1"
  op: "Mul"
  input: "MatMul_4"
  input: "dropout_3/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "add_2"
  op: "Add"
  input: "MatMul_2"
  input: "mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "add_3"
  op: "Add"
  input: "add_2"
  input: "Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Tanh_1"
  op: "Tanh"
  input: "add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub_3/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "sub_3"
  op: "Sub"
  input: "sub_3/x"
  input: "dropout_keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_5/Shape"
  op: "Shape"
  input: "Tanh_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_5/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_5/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_5/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_5/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 380
    }
  }
}
node {
  name: "dropout_5/random_uniform/sub"
  op: "Sub"
  input: "dropout_5/random_uniform/max"
  input: "dropout_5/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_5/random_uniform/mul"
  op: "Mul"
  input: "dropout_5/random_uniform/RandomUniform"
  input: "dropout_5/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_5/random_uniform"
  op: "Add"
  input: "dropout_5/random_uniform/mul"
  input: "dropout_5/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_5/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_5/sub"
  op: "Sub"
  input: "dropout_5/sub/x"
  input: "sub_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_5/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_5/truediv"
  op: "RealDiv"
  input: "dropout_5/truediv/x"
  input: "dropout_5/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_5/GreaterEqual"
  op: "GreaterEqual"
  input: "dropout_5/random_uniform"
  input: "sub_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_5/mul"
  op: "Mul"
  input: "Tanh_1"
  input: "dropout_5/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_5/Cast"
  op: "Cast"
  input: "dropout_5/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "dropout_5/mul_1"
  op: "Mul"
  input: "dropout_5/mul"
  input: "dropout_5/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MatMul_7"
  op: "MatMul"
  input: "dropout_5/mul_1"
  input: "xen0_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "packed"
  op: "Pack"
  input: "MatMul_6"
  input: "MatMul_7"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_2"
  op: "Transpose"
  input: "packed"
  input: "transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Softmax"
  op: "Softmax"
  input: "transpose_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "transpose_3/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\002\000\000\000\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_3"
  op: "Transpose"
  input: "Softmax"
  input: "transpose_3/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice"
  op: "StridedSlice"
  input: "transpose_3"
  input: "strided_slice/stack"
  input: "strided_slice/stack_1"
  input: "strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "Mul_2"
  op: "Mul"
  input: "MatMul_3"
  input: "strided_slice"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_1"
  op: "StridedSlice"
  input: "transpose_3"
  input: "strided_slice_1/stack"
  input: "strided_slice_1/stack_1"
  input: "strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "Mul_3"
  op: "Mul"
  input: "MatMul_5"
  input: "strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "packed_1"
  op: "Pack"
  input: "Mul_2"
  input: "Mul_3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "transpose_4/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_4"
  op: "Transpose"
  input: "packed_1"
  input: "transpose_4/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Sum"
  op: "Sum"
  input: "transpose_4"
  input: "Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "concat_2/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "concat_2"
  op: "ConcatV2"
  input: "dropout/en_h_drop/mul_1"
  input: "Sum"
  input: "concat_2/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "MatMul_8"
  op: "MatMul"
  input: "concat_2"
  input: "Ven0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "add_4"
  op: "Add"
  input: "MatMul_8"
  input: "Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Sigmoid_2"
  op: "Sigmoid"
  input: "add_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub_4/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "sub_4"
  op: "Sub"
  input: "sub_4/x"
  input: "dropout_keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_6/Shape"
  op: "Shape"
  input: "Sigmoid_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_6/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_6/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_6/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_6/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 424
    }
  }
}
node {
  name: "dropout_6/random_uniform/sub"
  op: "Sub"
  input: "dropout_6/random_uniform/max"
  input: "dropout_6/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_6/random_uniform/mul"
  op: "Mul"
  input: "dropout_6/random_uniform/RandomUniform"
  input: "dropout_6/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_6/random_uniform"
  op: "Add"
  input: "dropout_6/random_uniform/mul"
  input: "dropout_6/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_6/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_6/sub"
  op: "Sub"
  input: "dropout_6/sub/x"
  input: "sub_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_6/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_6/truediv"
  op: "RealDiv"
  input: "dropout_6/truediv/x"
  input: "dropout_6/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_6/GreaterEqual"
  op: "GreaterEqual"
  input: "dropout_6/random_uniform"
  input: "sub_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_6/mul"
  op: "Mul"
  input: "Sigmoid_2"
  input: "dropout_6/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_6/Cast"
  op: "Cast"
  input: "dropout_6/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "dropout_6/mul_1"
  op: "Mul"
  input: "dropout_6/mul"
  input: "dropout_6/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Mul_4"
  op: "Mul"
  input: "dropout/en_h_drop/mul_1"
  input: "dropout_6/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_5"
  op: "Mul"
  input: "MatMul_2"
  input: "dropout_2/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "add_5"
  op: "Add"
  input: "MatMul_4"
  input: "mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "add_6"
  op: "Add"
  input: "add_5"
  input: "Variable_2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Tanh_2"
  op: "Tanh"
  input: "add_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub_5/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "sub_5"
  op: "Sub"
  input: "sub_5/x"
  input: "dropout_keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_7/Shape"
  op: "Shape"
  input: "Tanh_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_7/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_7/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_7/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_7/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 446
    }
  }
}
node {
  name: "dropout_7/random_uniform/sub"
  op: "Sub"
  input: "dropout_7/random_uniform/max"
  input: "dropout_7/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_7/random_uniform/mul"
  op: "Mul"
  input: "dropout_7/random_uniform/RandomUniform"
  input: "dropout_7/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_7/random_uniform"
  op: "Add"
  input: "dropout_7/random_uniform/mul"
  input: "dropout_7/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_7/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_7/sub"
  op: "Sub"
  input: "dropout_7/sub/x"
  input: "sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_7/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_7/truediv"
  op: "RealDiv"
  input: "dropout_7/truediv/x"
  input: "dropout_7/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_7/GreaterEqual"
  op: "GreaterEqual"
  input: "dropout_7/random_uniform"
  input: "sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_7/mul"
  op: "Mul"
  input: "Tanh_2"
  input: "dropout_7/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_7/Cast"
  op: "Cast"
  input: "dropout_7/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "dropout_7/mul_1"
  op: "Mul"
  input: "dropout_7/mul"
  input: "dropout_7/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MatMul_9"
  op: "MatMul"
  input: "dropout_7/mul_1"
  input: "xmn0_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "mul_6"
  op: "Mul"
  input: "MatMul_4"
  input: "dropout_3/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "add_7"
  op: "Add"
  input: "MatMul_4"
  input: "mul_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "add_8"
  op: "Add"
  input: "add_7"
  input: "Variable_2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Tanh_3"
  op: "Tanh"
  input: "add_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub_6/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "sub_6"
  op: "Sub"
  input: "sub_6/x"
  input: "dropout_keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_8/Shape"
  op: "Shape"
  input: "Tanh_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_8/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_8/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_8/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_8/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 468
    }
  }
}
node {
  name: "dropout_8/random_uniform/sub"
  op: "Sub"
  input: "dropout_8/random_uniform/max"
  input: "dropout_8/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_8/random_uniform/mul"
  op: "Mul"
  input: "dropout_8/random_uniform/RandomUniform"
  input: "dropout_8/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_8/random_uniform"
  op: "Add"
  input: "dropout_8/random_uniform/mul"
  input: "dropout_8/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_8/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_8/sub"
  op: "Sub"
  input: "dropout_8/sub/x"
  input: "sub_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_8/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_8/truediv"
  op: "RealDiv"
  input: "dropout_8/truediv/x"
  input: "dropout_8/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_8/GreaterEqual"
  op: "GreaterEqual"
  input: "dropout_8/random_uniform"
  input: "sub_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_8/mul"
  op: "Mul"
  input: "Tanh_3"
  input: "dropout_8/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_8/Cast"
  op: "Cast"
  input: "dropout_8/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "dropout_8/mul_1"
  op: "Mul"
  input: "dropout_8/mul"
  input: "dropout_8/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MatMul_10"
  op: "MatMul"
  input: "dropout_8/mul_1"
  input: "xmn0_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "packed_2"
  op: "Pack"
  input: "MatMul_9"
  input: "MatMul_10"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "transpose_5/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_5"
  op: "Transpose"
  input: "packed_2"
  input: "transpose_5/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Softmax_1"
  op: "Softmax"
  input: "transpose_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "transpose_6/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\002\000\000\000\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_6"
  op: "Transpose"
  input: "Softmax_1"
  input: "transpose_6/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_2"
  op: "StridedSlice"
  input: "transpose_6"
  input: "strided_slice_2/stack"
  input: "strided_slice_2/stack_1"
  input: "strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "Mul_7"
  op: "Mul"
  input: "MatMul_3"
  input: "strided_slice_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_3"
  op: "StridedSlice"
  input: "transpose_6"
  input: "strided_slice_3/stack"
  input: "strided_slice_3/stack_1"
  input: "strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "Mul_8"
  op: "Mul"
  input: "MatMul_5"
  input: "strided_slice_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "packed_3"
  op: "Pack"
  input: "Mul_7"
  input: "Mul_8"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "transpose_7/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_7"
  op: "Transpose"
  input: "packed_3"
  input: "transpose_7/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Sum_1/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Sum_1"
  op: "Sum"
  input: "transpose_7"
  input: "Sum_1/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "concat_3/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "concat_3"
  op: "ConcatV2"
  input: "dropout_1/mn_h_drop/mul_1"
  input: "Sum_1"
  input: "concat_3/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "MatMul_11"
  op: "MatMul"
  input: "concat_3"
  input: "Vmn0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "add_9"
  op: "Add"
  input: "MatMul_11"
  input: "Variable_3/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Sigmoid_3"
  op: "Sigmoid"
  input: "add_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub_7/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "sub_7"
  op: "Sub"
  input: "sub_7/x"
  input: "dropout_keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_9/Shape"
  op: "Shape"
  input: "Sigmoid_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_9/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_9/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_9/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_9/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1234
    }
  }
  attr {
    key: "seed2"
    value {
      i: 512
    }
  }
}
node {
  name: "dropout_9/random_uniform/sub"
  op: "Sub"
  input: "dropout_9/random_uniform/max"
  input: "dropout_9/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_9/random_uniform/mul"
  op: "Mul"
  input: "dropout_9/random_uniform/RandomUniform"
  input: "dropout_9/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_9/random_uniform"
  op: "Add"
  input: "dropout_9/random_uniform/mul"
  input: "dropout_9/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_9/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_9/sub"
  op: "Sub"
  input: "dropout_9/sub/x"
  input: "sub_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_9/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_9/truediv"
  op: "RealDiv"
  input: "dropout_9/truediv/x"
  input: "dropout_9/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_9/GreaterEqual"
  op: "GreaterEqual"
  input: "dropout_9/random_uniform"
  input: "sub_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_9/mul"
  op: "Mul"
  input: "Sigmoid_3"
  input: "dropout_9/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_9/Cast"
  op: "Cast"
  input: "dropout_9/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "dropout_9/mul_1"
  op: "Mul"
  input: "dropout_9/mul"
  input: "dropout_9/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Mul_9"
  op: "Mul"
  input: "dropout_1/mn_h_drop/mul_1"
  input: "dropout_9/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "packed_4"
  op: "Pack"
  input: "Softmax"
  input: "Softmax_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "transpose_8/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_8"
  op: "Transpose"
  input: "packed_4"
  input: "transpose_8/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "concat_4/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "concat_4"
  op: "ConcatV2"
  input: "Mul_4"
  input: "Mul_9"
  input: "concat_4/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Const_4"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_4"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_4/Assign"
  op: "Assign"
  input: "Variable_4"
  input: "Const_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_4/read"
  op: "Identity"
  input: "Variable_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
}
node {
  name: "xw_plus_b/MatMul"
  op: "MatMul"
  input: "concat_4"
  input: "W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "xw_plus_b"
  op: "BiasAdd"
  input: "xw_plus_b/MatMul"
  input: "Variable_4/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "Softmax_2"
  op: "Softmax"
  input: "xw_plus_b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "prediction/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "prediction"
  op: "ArgMax"
  input: "xw_plus_b"
  input: "prediction/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/labels_stop_gradient"
  op: "StopGradient"
  input: "mn_input_y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Shape"
  op: "Shape"
  input: "xw_plus_b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Rank_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Shape_1"
  op: "Shape"
  input: "xw_plus_b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Sub/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Sub"
  op: "Sub"
  input: "loss/softmax_cross_entropy_with_logits_sg/Rank_1"
  input: "loss/softmax_cross_entropy_with_logits_sg/Sub/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Slice/begin"
  op: "Pack"
  input: "loss/softmax_cross_entropy_with_logits_sg/Sub"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Slice/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Slice"
  op: "Slice"
  input: "loss/softmax_cross_entropy_with_logits_sg/Shape_1"
  input: "loss/softmax_cross_entropy_with_logits_sg/Slice/begin"
  input: "loss/softmax_cross_entropy_with_logits_sg/Slice/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/concat/values_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/concat"
  op: "ConcatV2"
  input: "loss/softmax_cross_entropy_with_logits_sg/concat/values_0"
  input: "loss/softmax_cross_entropy_with_logits_sg/Slice"
  input: "loss/softmax_cross_entropy_with_logits_sg/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Reshape"
  op: "Reshape"
  input: "xw_plus_b"
  input: "loss/softmax_cross_entropy_with_logits_sg/concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Rank_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Shape_2"
  op: "Shape"
  input: "loss/softmax_cross_entropy_with_logits_sg/labels_stop_gradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Sub_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Sub_1"
  op: "Sub"
  input: "loss/softmax_cross_entropy_with_logits_sg/Rank_2"
  input: "loss/softmax_cross_entropy_with_logits_sg/Sub_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Slice_1/begin"
  op: "Pack"
  input: "loss/softmax_cross_entropy_with_logits_sg/Sub_1"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Slice_1/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Slice_1"
  op: "Slice"
  input: "loss/softmax_cross_entropy_with_logits_sg/Shape_2"
  input: "loss/softmax_cross_entropy_with_logits_sg/Slice_1/begin"
  input: "loss/softmax_cross_entropy_with_logits_sg/Slice_1/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/concat_1/values_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/concat_1"
  op: "ConcatV2"
  input: "loss/softmax_cross_entropy_with_logits_sg/concat_1/values_0"
  input: "loss/softmax_cross_entropy_with_logits_sg/Slice_1"
  input: "loss/softmax_cross_entropy_with_logits_sg/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Reshape_1"
  op: "Reshape"
  input: "loss/softmax_cross_entropy_with_logits_sg/labels_stop_gradient"
  input: "loss/softmax_cross_entropy_with_logits_sg/concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg"
  op: "SoftmaxCrossEntropyWithLogits"
  input: "loss/softmax_cross_entropy_with_logits_sg/Reshape"
  input: "loss/softmax_cross_entropy_with_logits_sg/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Sub_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Sub_2"
  op: "Sub"
  input: "loss/softmax_cross_entropy_with_logits_sg/Rank"
  input: "loss/softmax_cross_entropy_with_logits_sg/Sub_2/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Slice_2/begin"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Slice_2/size"
  op: "Pack"
  input: "loss/softmax_cross_entropy_with_logits_sg/Sub_2"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Slice_2"
  op: "Slice"
  input: "loss/softmax_cross_entropy_with_logits_sg/Shape"
  input: "loss/softmax_cross_entropy_with_logits_sg/Slice_2/begin"
  input: "loss/softmax_cross_entropy_with_logits_sg/Slice_2/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/softmax_cross_entropy_with_logits_sg/Reshape_2"
  op: "Reshape"
  input: "loss/softmax_cross_entropy_with_logits_sg"
  input: "loss/softmax_cross_entropy_with_logits_sg/Slice_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/L2Loss"
  op: "L2Loss"
  input: "Ten/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/add/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "loss/add"
  op: "Add"
  input: "loss/add/x"
  input: "loss/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/L2Loss_1"
  op: "L2Loss"
  input: "Tmn/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/add_1"
  op: "Add"
  input: "loss/add"
  input: "loss/L2Loss_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/L2Loss_2"
  op: "L2Loss"
  input: "Ven0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/add_2"
  op: "Add"
  input: "loss/add_1"
  input: "loss/L2Loss_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/L2Loss_3"
  op: "L2Loss"
  input: "Xen0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/add_3"
  op: "Add"
  input: "loss/add_2"
  input: "loss/L2Loss_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/L2Loss_4"
  op: "L2Loss"
  input: "Uen0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/add_4"
  op: "Add"
  input: "loss/add_3"
  input: "loss/L2Loss_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/L2Loss_5"
  op: "L2Loss"
  input: "Vmn0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/add_5"
  op: "Add"
  input: "loss/add_4"
  input: "loss/L2Loss_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/L2Loss_6"
  op: "L2Loss"
  input: "Xmn0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/add_6"
  op: "Add"
  input: "loss/add_5"
  input: "loss/L2Loss_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/L2Loss_7"
  op: "L2Loss"
  input: "Umn0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/add_7"
  op: "Add"
  input: "loss/add_6"
  input: "loss/L2Loss_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/L2Loss_8"
  op: "L2Loss"
  input: "W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/add_8/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "loss/add_8"
  op: "Add"
  input: "loss/add_8/x"
  input: "loss/L2Loss_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/Mean"
  op: "Mean"
  input: "loss/softmax_cross_entropy_with_logits_sg/Reshape_2"
  input: "loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "loss/mul"
  op: "Mul"
  input: "loss/mul/x"
  input: "loss/add_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/add_9"
  op: "Add"
  input: "loss/Mean"
  input: "loss/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "accuracy/ArgMax/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "accuracy/ArgMax"
  op: "ArgMax"
  input: "mn_input_y"
  input: "accuracy/ArgMax/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "accuracy/Equal"
  op: "Equal"
  input: "prediction"
  input: "accuracy/ArgMax"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "accuracy/Cast"
  op: "Cast"
  input: "accuracy/Equal"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "accuracy/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "accuracy/accuracy"
  op: "Sum"
  input: "accuracy/Cast"
  input: "accuracy/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/grad_ys_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/Fill"
  op: "Fill"
  input: "gradients/Shape"
  input: "gradients/grad_ys_0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/add_9_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Fill"
}
node {
  name: "gradients/loss/add_9_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Fill"
  input: "^gradients/loss/add_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Fill"
      }
    }
  }
}
node {
  name: "gradients/loss/add_9_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Fill"
  input: "^gradients/loss/add_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Fill"
      }
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/loss/add_9_grad/tuple/control_dependency"
  input: "gradients/loss/Mean_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Shape"
  op: "Shape"
  input: "loss/softmax_cross_entropy_with_logits_sg/Reshape_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Tile"
  op: "Tile"
  input: "gradients/loss/Mean_grad/Reshape"
  input: "gradients/loss/Mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Shape_1"
  op: "Shape"
  input: "loss/softmax_cross_entropy_with_logits_sg/Reshape_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Shape_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Prod"
  op: "Prod"
  input: "gradients/loss/Mean_grad/Shape_1"
  input: "gradients/loss/Mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/loss/Mean_grad/Shape_2"
  input: "gradients/loss/Mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/loss/Mean_grad/Prod_1"
  input: "gradients/loss/Mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/loss/Mean_grad/Prod"
  input: "gradients/loss/Mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/Cast"
  op: "Cast"
  input: "gradients/loss/Mean_grad/floordiv"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/loss/Mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/loss/Mean_grad/Tile"
  input: "gradients/loss/Mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/loss/mul_grad/Mul"
  op: "Mul"
  input: "gradients/loss/add_9_grad/tuple/control_dependency_1"
  input: "loss/add_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/loss/mul_grad/Mul_1"
  op: "Mul"
  input: "gradients/loss/add_9_grad/tuple/control_dependency_1"
  input: "loss/mul/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/loss/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/loss/mul_grad/Mul"
  input: "^gradients/loss/mul_grad/Mul_1"
}
node {
  name: "gradients/loss/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/loss/mul_grad/Mul"
  input: "^gradients/loss/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/loss/mul_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/loss/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/loss/mul_grad/Mul_1"
  input: "^gradients/loss/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/loss/mul_grad/Mul_1"
      }
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Shape"
  op: "Shape"
  input: "loss/softmax_cross_entropy_with_logits_sg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/loss/Mean_grad/truediv"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/add_8_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/loss/mul_grad/tuple/control_dependency_1"
}
node {
  name: "gradients/loss/add_8_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/loss/mul_grad/tuple/control_dependency_1"
  input: "^gradients/loss/add_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/loss/mul_grad/Mul_1"
      }
    }
  }
}
node {
  name: "gradients/loss/add_8_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/loss/mul_grad/tuple/control_dependency_1"
  input: "^gradients/loss/add_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/loss/mul_grad/Mul_1"
      }
    }
  }
}
node {
  name: "gradients/zeros_like"
  op: "ZerosLike"
  input: "loss/softmax_cross_entropy_with_logits_sg:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/ExpandDims/dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/ExpandDims"
  op: "ExpandDims"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Reshape"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/ExpandDims/dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/mul"
  op: "Mul"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/ExpandDims"
  input: "loss/softmax_cross_entropy_with_logits_sg:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/LogSoftmax"
  op: "LogSoftmax"
  input: "loss/softmax_cross_entropy_with_logits_sg/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/Neg"
  op: "Neg"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/LogSoftmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1/dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1"
  op: "ExpandDims"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Reshape"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1/dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/mul_1"
  op: "Mul"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/loss/softmax_cross_entropy_with_logits_sg_grad/mul"
  input: "^gradients/loss/softmax_cross_entropy_with_logits_sg_grad/mul_1"
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/mul"
  input: "^gradients/loss/softmax_cross_entropy_with_logits_sg_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/loss/softmax_cross_entropy_with_logits_sg_grad/mul"
      }
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/mul_1"
  input: "^gradients/loss/softmax_cross_entropy_with_logits_sg_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/loss/softmax_cross_entropy_with_logits_sg_grad/mul_1"
      }
    }
  }
}
node {
  name: "gradients/loss/L2Loss_8_grad/mul"
  op: "Mul"
  input: "W/read"
  input: "gradients/loss/add_8_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_grad/Shape"
  op: "Shape"
  input: "xw_plus_b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependency"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/xw_plus_b_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/xw_plus_b_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape"
  input: "^gradients/xw_plus_b_grad/BiasAddGrad"
}
node {
  name: "gradients/xw_plus_b_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape"
  input: "^gradients/xw_plus_b_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/loss/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/xw_plus_b_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/xw_plus_b_grad/BiasAddGrad"
  input: "^gradients/xw_plus_b_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/xw_plus_b_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/xw_plus_b/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/xw_plus_b_grad/tuple/control_dependency"
  input: "W/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/xw_plus_b/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "concat_4"
  input: "gradients/xw_plus_b_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/xw_plus_b/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/xw_plus_b/MatMul_grad/MatMul"
  input: "^gradients/xw_plus_b/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/xw_plus_b/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/xw_plus_b/MatMul_grad/MatMul"
  input: "^gradients/xw_plus_b/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/xw_plus_b/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/xw_plus_b/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/xw_plus_b/MatMul_grad/MatMul_1"
  input: "^gradients/xw_plus_b/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/xw_plus_b/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/concat_4_grad/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/concat_4_grad/mod"
  op: "FloorMod"
  input: "concat_4/axis"
  input: "gradients/concat_4_grad/Rank"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_4_grad/Shape"
  op: "Shape"
  input: "Mul_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_4_grad/ShapeN"
  op: "ShapeN"
  input: "Mul_4"
  input: "Mul_9"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_4_grad/ConcatOffset"
  op: "ConcatOffset"
  input: "gradients/concat_4_grad/mod"
  input: "gradients/concat_4_grad/ShapeN"
  input: "gradients/concat_4_grad/ShapeN:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
}
node {
  name: "gradients/concat_4_grad/Slice"
  op: "Slice"
  input: "gradients/xw_plus_b/MatMul_grad/tuple/control_dependency"
  input: "gradients/concat_4_grad/ConcatOffset"
  input: "gradients/concat_4_grad/ShapeN"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_4_grad/Slice_1"
  op: "Slice"
  input: "gradients/xw_plus_b/MatMul_grad/tuple/control_dependency"
  input: "gradients/concat_4_grad/ConcatOffset:1"
  input: "gradients/concat_4_grad/ShapeN:1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/concat_4_grad/Slice"
  input: "^gradients/concat_4_grad/Slice_1"
}
node {
  name: "gradients/concat_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/concat_4_grad/Slice"
  input: "^gradients/concat_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_4_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/concat_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/concat_4_grad/Slice_1"
  input: "^gradients/concat_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_4_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/AddN"
  op: "AddN"
  input: "gradients/loss/L2Loss_8_grad/mul"
  input: "gradients/xw_plus_b/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/loss/L2Loss_8_grad/mul"
      }
    }
  }
}
node {
  name: "gradients/Mul_4_grad/Shape"
  op: "Shape"
  input: "dropout/en_h_drop/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_4_grad/Shape_1"
  op: "Shape"
  input: "dropout_6/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_4_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Mul_4_grad/Shape"
  input: "gradients/Mul_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_4_grad/Mul"
  op: "Mul"
  input: "gradients/concat_4_grad/tuple/control_dependency"
  input: "dropout_6/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_4_grad/Sum"
  op: "Sum"
  input: "gradients/Mul_4_grad/Mul"
  input: "gradients/Mul_4_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_4_grad/Reshape"
  op: "Reshape"
  input: "gradients/Mul_4_grad/Sum"
  input: "gradients/Mul_4_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_4_grad/Mul_1"
  op: "Mul"
  input: "dropout/en_h_drop/mul_1"
  input: "gradients/concat_4_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_4_grad/Sum_1"
  op: "Sum"
  input: "gradients/Mul_4_grad/Mul_1"
  input: "gradients/Mul_4_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_4_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Mul_4_grad/Sum_1"
  input: "gradients/Mul_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Mul_4_grad/Reshape"
  input: "^gradients/Mul_4_grad/Reshape_1"
}
node {
  name: "gradients/Mul_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Mul_4_grad/Reshape"
  input: "^gradients/Mul_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_4_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Mul_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Mul_4_grad/Reshape_1"
  input: "^gradients/Mul_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_4_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Mul_9_grad/Shape"
  op: "Shape"
  input: "dropout_1/mn_h_drop/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_9_grad/Shape_1"
  op: "Shape"
  input: "dropout_9/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_9_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Mul_9_grad/Shape"
  input: "gradients/Mul_9_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_9_grad/Mul"
  op: "Mul"
  input: "gradients/concat_4_grad/tuple/control_dependency_1"
  input: "dropout_9/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_9_grad/Sum"
  op: "Sum"
  input: "gradients/Mul_9_grad/Mul"
  input: "gradients/Mul_9_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_9_grad/Reshape"
  op: "Reshape"
  input: "gradients/Mul_9_grad/Sum"
  input: "gradients/Mul_9_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_9_grad/Mul_1"
  op: "Mul"
  input: "dropout_1/mn_h_drop/mul_1"
  input: "gradients/concat_4_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_9_grad/Sum_1"
  op: "Sum"
  input: "gradients/Mul_9_grad/Mul_1"
  input: "gradients/Mul_9_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_9_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Mul_9_grad/Sum_1"
  input: "gradients/Mul_9_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_9_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Mul_9_grad/Reshape"
  input: "^gradients/Mul_9_grad/Reshape_1"
}
node {
  name: "gradients/Mul_9_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Mul_9_grad/Reshape"
  input: "^gradients/Mul_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_9_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Mul_9_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Mul_9_grad/Reshape_1"
  input: "^gradients/Mul_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_9_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_6/mul_1_grad/Shape"
  op: "Shape"
  input: "dropout_6/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_6/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_6/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_6/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_6/mul_1_grad/Shape"
  input: "gradients/dropout_6/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_6/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/Mul_4_grad/tuple/control_dependency_1"
  input: "dropout_6/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_6/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_6/mul_1_grad/Mul"
  input: "gradients/dropout_6/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_6/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_6/mul_1_grad/Sum"
  input: "gradients/dropout_6/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_6/mul_1_grad/Mul_1"
  op: "Mul"
  input: "dropout_6/mul"
  input: "gradients/Mul_4_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_6/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_6/mul_1_grad/Mul_1"
  input: "gradients/dropout_6/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_6/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_6/mul_1_grad/Sum_1"
  input: "gradients/dropout_6/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_6/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_6/mul_1_grad/Reshape"
  input: "^gradients/dropout_6/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_6/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_6/mul_1_grad/Reshape"
  input: "^gradients/dropout_6/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_6/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_6/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_6/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_6/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_6/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_9/mul_1_grad/Shape"
  op: "Shape"
  input: "dropout_9/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_9/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_9/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_9/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_9/mul_1_grad/Shape"
  input: "gradients/dropout_9/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_9/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/Mul_9_grad/tuple/control_dependency_1"
  input: "dropout_9/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_9/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_9/mul_1_grad/Mul"
  input: "gradients/dropout_9/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_9/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_9/mul_1_grad/Sum"
  input: "gradients/dropout_9/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_9/mul_1_grad/Mul_1"
  op: "Mul"
  input: "dropout_9/mul"
  input: "gradients/Mul_9_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_9/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_9/mul_1_grad/Mul_1"
  input: "gradients/dropout_9/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_9/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_9/mul_1_grad/Sum_1"
  input: "gradients/dropout_9/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_9/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_9/mul_1_grad/Reshape"
  input: "^gradients/dropout_9/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_9/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_9/mul_1_grad/Reshape"
  input: "^gradients/dropout_9/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_9/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_9/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_9/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_9/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_9/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_6/mul_grad/Shape"
  op: "Shape"
  input: "Sigmoid_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_6/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_6/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_6/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_6/mul_grad/Shape"
  input: "gradients/dropout_6/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_6/mul_grad/Mul"
  op: "Mul"
  input: "gradients/dropout_6/mul_1_grad/tuple/control_dependency"
  input: "dropout_6/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_6/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_6/mul_grad/Mul"
  input: "gradients/dropout_6/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_6/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_6/mul_grad/Sum"
  input: "gradients/dropout_6/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_6/mul_grad/Mul_1"
  op: "Mul"
  input: "Sigmoid_2"
  input: "gradients/dropout_6/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_6/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_6/mul_grad/Mul_1"
  input: "gradients/dropout_6/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_6/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_6/mul_grad/Sum_1"
  input: "gradients/dropout_6/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_6/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_6/mul_grad/Reshape"
  input: "^gradients/dropout_6/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_6/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_6/mul_grad/Reshape"
  input: "^gradients/dropout_6/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_6/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_6/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_6/mul_grad/Reshape_1"
  input: "^gradients/dropout_6/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_6/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_9/mul_grad/Shape"
  op: "Shape"
  input: "Sigmoid_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_9/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_9/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_9/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_9/mul_grad/Shape"
  input: "gradients/dropout_9/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_9/mul_grad/Mul"
  op: "Mul"
  input: "gradients/dropout_9/mul_1_grad/tuple/control_dependency"
  input: "dropout_9/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_9/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_9/mul_grad/Mul"
  input: "gradients/dropout_9/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_9/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_9/mul_grad/Sum"
  input: "gradients/dropout_9/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_9/mul_grad/Mul_1"
  op: "Mul"
  input: "Sigmoid_3"
  input: "gradients/dropout_9/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_9/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_9/mul_grad/Mul_1"
  input: "gradients/dropout_9/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_9/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_9/mul_grad/Sum_1"
  input: "gradients/dropout_9/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_9/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_9/mul_grad/Reshape"
  input: "^gradients/dropout_9/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_9/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_9/mul_grad/Reshape"
  input: "^gradients/dropout_9/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_9/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_9/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_9/mul_grad/Reshape_1"
  input: "^gradients/dropout_9/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_9/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Sigmoid_2_grad/SigmoidGrad"
  op: "SigmoidGrad"
  input: "Sigmoid_2"
  input: "gradients/dropout_6/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Sigmoid_3_grad/SigmoidGrad"
  op: "SigmoidGrad"
  input: "Sigmoid_3"
  input: "gradients/dropout_9/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/add_4_grad/Shape"
  op: "Shape"
  input: "MatMul_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "gradients/add_4_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_4_grad/Shape"
  input: "gradients/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/Sum"
  op: "Sum"
  input: "gradients/Sigmoid_2_grad/SigmoidGrad"
  input: "gradients/add_4_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_4_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_4_grad/Sum"
  input: "gradients/add_4_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/Sum_1"
  op: "Sum"
  input: "gradients/Sigmoid_2_grad/SigmoidGrad"
  input: "gradients/add_4_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_4_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_4_grad/Sum_1"
  input: "gradients/add_4_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_4_grad/Reshape"
  input: "^gradients/add_4_grad/Reshape_1"
}
node {
  name: "gradients/add_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_4_grad/Reshape"
  input: "^gradients/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_4_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_4_grad/Reshape_1"
  input: "^gradients/add_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_4_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/add_9_grad/Shape"
  op: "Shape"
  input: "MatMul_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_9_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "gradients/add_9_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_9_grad/Shape"
  input: "gradients/add_9_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_9_grad/Sum"
  op: "Sum"
  input: "gradients/Sigmoid_3_grad/SigmoidGrad"
  input: "gradients/add_9_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_9_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_9_grad/Sum"
  input: "gradients/add_9_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_9_grad/Sum_1"
  op: "Sum"
  input: "gradients/Sigmoid_3_grad/SigmoidGrad"
  input: "gradients/add_9_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_9_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_9_grad/Sum_1"
  input: "gradients/add_9_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_9_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_9_grad/Reshape"
  input: "^gradients/add_9_grad/Reshape_1"
}
node {
  name: "gradients/add_9_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_9_grad/Reshape"
  input: "^gradients/add_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_9_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_9_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_9_grad/Reshape_1"
  input: "^gradients/add_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_9_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_8_grad/MatMul"
  op: "MatMul"
  input: "gradients/add_4_grad/tuple/control_dependency"
  input: "Ven0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_8_grad/MatMul_1"
  op: "MatMul"
  input: "concat_2"
  input: "gradients/add_4_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_8_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_8_grad/MatMul"
  input: "^gradients/MatMul_8_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_8_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_8_grad/MatMul"
  input: "^gradients/MatMul_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_8_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_8_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_8_grad/MatMul_1"
  input: "^gradients/MatMul_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_8_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_11_grad/MatMul"
  op: "MatMul"
  input: "gradients/add_9_grad/tuple/control_dependency"
  input: "Vmn0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_11_grad/MatMul_1"
  op: "MatMul"
  input: "concat_3"
  input: "gradients/add_9_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_11_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_11_grad/MatMul"
  input: "^gradients/MatMul_11_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_11_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_11_grad/MatMul"
  input: "^gradients/MatMul_11_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_11_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_11_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_11_grad/MatMul_1"
  input: "^gradients/MatMul_11_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_11_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/concat_2_grad/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/concat_2_grad/mod"
  op: "FloorMod"
  input: "concat_2/axis"
  input: "gradients/concat_2_grad/Rank"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_2_grad/Shape"
  op: "Shape"
  input: "dropout/en_h_drop/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_2_grad/ShapeN"
  op: "ShapeN"
  input: "dropout/en_h_drop/mul_1"
  input: "Sum"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_2_grad/ConcatOffset"
  op: "ConcatOffset"
  input: "gradients/concat_2_grad/mod"
  input: "gradients/concat_2_grad/ShapeN"
  input: "gradients/concat_2_grad/ShapeN:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
}
node {
  name: "gradients/concat_2_grad/Slice"
  op: "Slice"
  input: "gradients/MatMul_8_grad/tuple/control_dependency"
  input: "gradients/concat_2_grad/ConcatOffset"
  input: "gradients/concat_2_grad/ShapeN"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_2_grad/Slice_1"
  op: "Slice"
  input: "gradients/MatMul_8_grad/tuple/control_dependency"
  input: "gradients/concat_2_grad/ConcatOffset:1"
  input: "gradients/concat_2_grad/ShapeN:1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/concat_2_grad/Slice"
  input: "^gradients/concat_2_grad/Slice_1"
}
node {
  name: "gradients/concat_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/concat_2_grad/Slice"
  input: "^gradients/concat_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_2_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/concat_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/concat_2_grad/Slice_1"
  input: "^gradients/concat_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_2_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/concat_3_grad/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/concat_3_grad/mod"
  op: "FloorMod"
  input: "concat_3/axis"
  input: "gradients/concat_3_grad/Rank"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_3_grad/Shape"
  op: "Shape"
  input: "dropout_1/mn_h_drop/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_3_grad/ShapeN"
  op: "ShapeN"
  input: "dropout_1/mn_h_drop/mul_1"
  input: "Sum_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_3_grad/ConcatOffset"
  op: "ConcatOffset"
  input: "gradients/concat_3_grad/mod"
  input: "gradients/concat_3_grad/ShapeN"
  input: "gradients/concat_3_grad/ShapeN:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
}
node {
  name: "gradients/concat_3_grad/Slice"
  op: "Slice"
  input: "gradients/MatMul_11_grad/tuple/control_dependency"
  input: "gradients/concat_3_grad/ConcatOffset"
  input: "gradients/concat_3_grad/ShapeN"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_3_grad/Slice_1"
  op: "Slice"
  input: "gradients/MatMul_11_grad/tuple/control_dependency"
  input: "gradients/concat_3_grad/ConcatOffset:1"
  input: "gradients/concat_3_grad/ShapeN:1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/concat_3_grad/Slice"
  input: "^gradients/concat_3_grad/Slice_1"
}
node {
  name: "gradients/concat_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/concat_3_grad/Slice"
  input: "^gradients/concat_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_3_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/concat_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/concat_3_grad/Slice_1"
  input: "^gradients/concat_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_3_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/Shape"
  op: "Shape"
  input: "transpose_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/add"
  op: "Add"
  input: "Sum/reduction_indices"
  input: "gradients/Sum_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/mod"
  op: "FloorMod"
  input: "gradients/Sum_grad/add"
  input: "gradients/Sum_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/range"
  op: "Range"
  input: "gradients/Sum_grad/range/start"
  input: "gradients/Sum_grad/Size"
  input: "gradients/Sum_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/Fill"
  op: "Fill"
  input: "gradients/Sum_grad/Shape_1"
  input: "gradients/Sum_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/Sum_grad/range"
  input: "gradients/Sum_grad/mod"
  input: "gradients/Sum_grad/Shape"
  input: "gradients/Sum_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/Maximum"
  op: "Maximum"
  input: "gradients/Sum_grad/DynamicStitch"
  input: "gradients/Sum_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/Sum_grad/Shape"
  input: "gradients/Sum_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/Reshape"
  op: "Reshape"
  input: "gradients/concat_2_grad/tuple/control_dependency_1"
  input: "gradients/Sum_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_grad/Tile"
  op: "Tile"
  input: "gradients/Sum_grad/Reshape"
  input: "gradients/Sum_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Shape"
  op: "Shape"
  input: "transpose_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/add"
  op: "Add"
  input: "Sum_1/reduction_indices"
  input: "gradients/Sum_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/mod"
  op: "FloorMod"
  input: "gradients/Sum_1_grad/add"
  input: "gradients/Sum_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/range"
  op: "Range"
  input: "gradients/Sum_1_grad/range/start"
  input: "gradients/Sum_1_grad/Size"
  input: "gradients/Sum_1_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Fill"
  op: "Fill"
  input: "gradients/Sum_1_grad/Shape_1"
  input: "gradients/Sum_1_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/Sum_1_grad/range"
  input: "gradients/Sum_1_grad/mod"
  input: "gradients/Sum_1_grad/Shape"
  input: "gradients/Sum_1_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Maximum"
  op: "Maximum"
  input: "gradients/Sum_1_grad/DynamicStitch"
  input: "gradients/Sum_1_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/Sum_1_grad/Shape"
  input: "gradients/Sum_1_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sum_1_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/concat_3_grad/tuple/control_dependency_1"
  input: "gradients/Sum_1_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Tile"
  op: "Tile"
  input: "gradients/Sum_1_grad/Reshape"
  input: "gradients/Sum_1_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_4_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "transpose_4/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_4_grad/transpose"
  op: "Transpose"
  input: "gradients/Sum_grad/Tile"
  input: "gradients/transpose_4_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_7_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "transpose_7/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_7_grad/transpose"
  op: "Transpose"
  input: "gradients/Sum_1_grad/Tile"
  input: "gradients/transpose_7_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/packed_1_grad/unstack"
  op: "Unpack"
  input: "gradients/transpose_4_grad/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
  attr {
    key: "num"
    value {
      i: 2
    }
  }
}
node {
  name: "gradients/packed_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/packed_1_grad/unstack"
}
node {
  name: "gradients/packed_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/packed_1_grad/unstack"
  input: "^gradients/packed_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/packed_1_grad/unstack"
      }
    }
  }
}
node {
  name: "gradients/packed_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/packed_1_grad/unstack:1"
  input: "^gradients/packed_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/packed_1_grad/unstack"
      }
    }
  }
}
node {
  name: "gradients/packed_3_grad/unstack"
  op: "Unpack"
  input: "gradients/transpose_7_grad/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
  attr {
    key: "num"
    value {
      i: 2
    }
  }
}
node {
  name: "gradients/packed_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/packed_3_grad/unstack"
}
node {
  name: "gradients/packed_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/packed_3_grad/unstack"
  input: "^gradients/packed_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/packed_3_grad/unstack"
      }
    }
  }
}
node {
  name: "gradients/packed_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/packed_3_grad/unstack:1"
  input: "^gradients/packed_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/packed_3_grad/unstack"
      }
    }
  }
}
node {
  name: "gradients/Mul_2_grad/Shape"
  op: "Shape"
  input: "MatMul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_2_grad/Shape_1"
  op: "Shape"
  input: "strided_slice"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Mul_2_grad/Shape"
  input: "gradients/Mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_2_grad/Mul"
  op: "Mul"
  input: "gradients/packed_1_grad/tuple/control_dependency"
  input: "strided_slice"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_2_grad/Sum"
  op: "Sum"
  input: "gradients/Mul_2_grad/Mul"
  input: "gradients/Mul_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/Mul_2_grad/Sum"
  input: "gradients/Mul_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_2_grad/Mul_1"
  op: "Mul"
  input: "MatMul_3"
  input: "gradients/packed_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/Mul_2_grad/Mul_1"
  input: "gradients/Mul_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Mul_2_grad/Sum_1"
  input: "gradients/Mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Mul_2_grad/Reshape"
  input: "^gradients/Mul_2_grad/Reshape_1"
}
node {
  name: "gradients/Mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Mul_2_grad/Reshape"
  input: "^gradients/Mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Mul_2_grad/Reshape_1"
  input: "^gradients/Mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Mul_3_grad/Shape"
  op: "Shape"
  input: "MatMul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_3_grad/Shape_1"
  op: "Shape"
  input: "strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_3_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Mul_3_grad/Shape"
  input: "gradients/Mul_3_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_3_grad/Mul"
  op: "Mul"
  input: "gradients/packed_1_grad/tuple/control_dependency_1"
  input: "strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_3_grad/Sum"
  op: "Sum"
  input: "gradients/Mul_3_grad/Mul"
  input: "gradients/Mul_3_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_3_grad/Reshape"
  op: "Reshape"
  input: "gradients/Mul_3_grad/Sum"
  input: "gradients/Mul_3_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_3_grad/Mul_1"
  op: "Mul"
  input: "MatMul_5"
  input: "gradients/packed_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_3_grad/Sum_1"
  op: "Sum"
  input: "gradients/Mul_3_grad/Mul_1"
  input: "gradients/Mul_3_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_3_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Mul_3_grad/Sum_1"
  input: "gradients/Mul_3_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Mul_3_grad/Reshape"
  input: "^gradients/Mul_3_grad/Reshape_1"
}
node {
  name: "gradients/Mul_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Mul_3_grad/Reshape"
  input: "^gradients/Mul_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_3_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Mul_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Mul_3_grad/Reshape_1"
  input: "^gradients/Mul_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_3_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Mul_7_grad/Shape"
  op: "Shape"
  input: "MatMul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_7_grad/Shape_1"
  op: "Shape"
  input: "strided_slice_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_7_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Mul_7_grad/Shape"
  input: "gradients/Mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_7_grad/Mul"
  op: "Mul"
  input: "gradients/packed_3_grad/tuple/control_dependency"
  input: "strided_slice_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_7_grad/Sum"
  op: "Sum"
  input: "gradients/Mul_7_grad/Mul"
  input: "gradients/Mul_7_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_7_grad/Reshape"
  op: "Reshape"
  input: "gradients/Mul_7_grad/Sum"
  input: "gradients/Mul_7_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_7_grad/Mul_1"
  op: "Mul"
  input: "MatMul_3"
  input: "gradients/packed_3_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_7_grad/Sum_1"
  op: "Sum"
  input: "gradients/Mul_7_grad/Mul_1"
  input: "gradients/Mul_7_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_7_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Mul_7_grad/Sum_1"
  input: "gradients/Mul_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_7_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Mul_7_grad/Reshape"
  input: "^gradients/Mul_7_grad/Reshape_1"
}
node {
  name: "gradients/Mul_7_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Mul_7_grad/Reshape"
  input: "^gradients/Mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_7_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Mul_7_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Mul_7_grad/Reshape_1"
  input: "^gradients/Mul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_7_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Mul_8_grad/Shape"
  op: "Shape"
  input: "MatMul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_8_grad/Shape_1"
  op: "Shape"
  input: "strided_slice_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_8_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Mul_8_grad/Shape"
  input: "gradients/Mul_8_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_8_grad/Mul"
  op: "Mul"
  input: "gradients/packed_3_grad/tuple/control_dependency_1"
  input: "strided_slice_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_8_grad/Sum"
  op: "Sum"
  input: "gradients/Mul_8_grad/Mul"
  input: "gradients/Mul_8_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_8_grad/Reshape"
  op: "Reshape"
  input: "gradients/Mul_8_grad/Sum"
  input: "gradients/Mul_8_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_8_grad/Mul_1"
  op: "Mul"
  input: "MatMul_5"
  input: "gradients/packed_3_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_8_grad/Sum_1"
  op: "Sum"
  input: "gradients/Mul_8_grad/Mul_1"
  input: "gradients/Mul_8_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_8_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Mul_8_grad/Sum_1"
  input: "gradients/Mul_8_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_8_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Mul_8_grad/Reshape"
  input: "^gradients/Mul_8_grad/Reshape_1"
}
node {
  name: "gradients/Mul_8_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Mul_8_grad/Reshape"
  input: "^gradients/Mul_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_8_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Mul_8_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Mul_8_grad/Reshape_1"
  input: "^gradients/Mul_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_8_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/strided_slice_grad/Shape"
  op: "Shape"
  input: "transpose_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/strided_slice_grad/StridedSliceGrad"
  op: "StridedSliceGrad"
  input: "gradients/strided_slice_grad/Shape"
  input: "strided_slice/stack"
  input: "strided_slice/stack_1"
  input: "strided_slice/stack_2"
  input: "gradients/Mul_2_grad/tuple/control_dependency_1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "gradients/strided_slice_1_grad/Shape"
  op: "Shape"
  input: "transpose_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/strided_slice_1_grad/StridedSliceGrad"
  op: "StridedSliceGrad"
  input: "gradients/strided_slice_1_grad/Shape"
  input: "strided_slice_1/stack"
  input: "strided_slice_1/stack_1"
  input: "strided_slice_1/stack_2"
  input: "gradients/Mul_3_grad/tuple/control_dependency_1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "gradients/AddN_1"
  op: "AddN"
  input: "gradients/Mul_2_grad/tuple/control_dependency"
  input: "gradients/Mul_7_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/MatMul_3_grad/MatMul"
  op: "MatMul"
  input: "gradients/AddN_1"
  input: "Uen0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_3_grad/MatMul_1"
  op: "MatMul"
  input: "dropout/en_h_drop/mul_1"
  input: "gradients/AddN_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_3_grad/MatMul"
  input: "^gradients/MatMul_3_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_3_grad/MatMul"
  input: "^gradients/MatMul_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_3_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_3_grad/MatMul_1"
  input: "^gradients/MatMul_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_3_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/strided_slice_2_grad/Shape"
  op: "Shape"
  input: "transpose_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/strided_slice_2_grad/StridedSliceGrad"
  op: "StridedSliceGrad"
  input: "gradients/strided_slice_2_grad/Shape"
  input: "strided_slice_2/stack"
  input: "strided_slice_2/stack_1"
  input: "strided_slice_2/stack_2"
  input: "gradients/Mul_7_grad/tuple/control_dependency_1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "gradients/AddN_2"
  op: "AddN"
  input: "gradients/Mul_3_grad/tuple/control_dependency"
  input: "gradients/Mul_8_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_3_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/MatMul_5_grad/MatMul"
  op: "MatMul"
  input: "gradients/AddN_2"
  input: "Umn0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_5_grad/MatMul_1"
  op: "MatMul"
  input: "dropout_1/mn_h_drop/mul_1"
  input: "gradients/AddN_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_5_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_5_grad/MatMul"
  input: "^gradients/MatMul_5_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_5_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_5_grad/MatMul"
  input: "^gradients/MatMul_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_5_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_5_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_5_grad/MatMul_1"
  input: "^gradients/MatMul_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_5_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/strided_slice_3_grad/Shape"
  op: "Shape"
  input: "transpose_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/strided_slice_3_grad/StridedSliceGrad"
  op: "StridedSliceGrad"
  input: "gradients/strided_slice_3_grad/Shape"
  input: "strided_slice_3/stack"
  input: "strided_slice_3/stack_1"
  input: "strided_slice_3/stack_2"
  input: "gradients/Mul_8_grad/tuple/control_dependency_1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "gradients/AddN_3"
  op: "AddN"
  input: "gradients/strided_slice_grad/StridedSliceGrad"
  input: "gradients/strided_slice_1_grad/StridedSliceGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/strided_slice_grad/StridedSliceGrad"
      }
    }
  }
}
node {
  name: "gradients/transpose_3_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "transpose_3/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_3_grad/transpose"
  op: "Transpose"
  input: "gradients/AddN_3"
  input: "gradients/transpose_3_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AddN_4"
  op: "AddN"
  input: "gradients/strided_slice_2_grad/StridedSliceGrad"
  input: "gradients/strided_slice_3_grad/StridedSliceGrad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/strided_slice_2_grad/StridedSliceGrad"
      }
    }
  }
}
node {
  name: "gradients/transpose_6_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "transpose_6/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_6_grad/transpose"
  op: "Transpose"
  input: "gradients/AddN_4"
  input: "gradients/transpose_6_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Softmax_grad/mul"
  op: "Mul"
  input: "gradients/transpose_3_grad/transpose"
  input: "Softmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Softmax_grad/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "gradients/Softmax_grad/Sum"
  op: "Sum"
  input: "gradients/Softmax_grad/mul"
  input: "gradients/Softmax_grad/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Softmax_grad/sub"
  op: "Sub"
  input: "gradients/transpose_3_grad/transpose"
  input: "gradients/Softmax_grad/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Softmax_grad/mul_1"
  op: "Mul"
  input: "gradients/Softmax_grad/sub"
  input: "Softmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Softmax_1_grad/mul"
  op: "Mul"
  input: "gradients/transpose_6_grad/transpose"
  input: "Softmax_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Softmax_1_grad/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "gradients/Softmax_1_grad/Sum"
  op: "Sum"
  input: "gradients/Softmax_1_grad/mul"
  input: "gradients/Softmax_1_grad/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/Softmax_1_grad/sub"
  op: "Sub"
  input: "gradients/transpose_6_grad/transpose"
  input: "gradients/Softmax_1_grad/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Softmax_1_grad/mul_1"
  op: "Mul"
  input: "gradients/Softmax_1_grad/sub"
  input: "Softmax_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/transpose_2_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_2_grad/transpose"
  op: "Transpose"
  input: "gradients/Softmax_grad/mul_1"
  input: "gradients/transpose_2_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_5_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "transpose_5/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_5_grad/transpose"
  op: "Transpose"
  input: "gradients/Softmax_1_grad/mul_1"
  input: "gradients/transpose_5_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/packed_grad/unstack"
  op: "Unpack"
  input: "gradients/transpose_2_grad/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
  attr {
    key: "num"
    value {
      i: 2
    }
  }
}
node {
  name: "gradients/packed_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/packed_grad/unstack"
}
node {
  name: "gradients/packed_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/packed_grad/unstack"
  input: "^gradients/packed_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/packed_grad/unstack"
      }
    }
  }
}
node {
  name: "gradients/packed_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/packed_grad/unstack:1"
  input: "^gradients/packed_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/packed_grad/unstack"
      }
    }
  }
}
node {
  name: "gradients/packed_2_grad/unstack"
  op: "Unpack"
  input: "gradients/transpose_5_grad/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
  attr {
    key: "num"
    value {
      i: 2
    }
  }
}
node {
  name: "gradients/packed_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/packed_2_grad/unstack"
}
node {
  name: "gradients/packed_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/packed_2_grad/unstack"
  input: "^gradients/packed_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/packed_2_grad/unstack"
      }
    }
  }
}
node {
  name: "gradients/packed_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/packed_2_grad/unstack:1"
  input: "^gradients/packed_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/packed_2_grad/unstack"
      }
    }
  }
}
node {
  name: "gradients/MatMul_6_grad/MatMul"
  op: "MatMul"
  input: "gradients/packed_grad/tuple/control_dependency"
  input: "xen0_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_6_grad/MatMul_1"
  op: "MatMul"
  input: "dropout_4/mul_1"
  input: "gradients/packed_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_6_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_6_grad/MatMul"
  input: "^gradients/MatMul_6_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_6_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_6_grad/MatMul"
  input: "^gradients/MatMul_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_6_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_6_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_6_grad/MatMul_1"
  input: "^gradients/MatMul_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_6_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_7_grad/MatMul"
  op: "MatMul"
  input: "gradients/packed_grad/tuple/control_dependency_1"
  input: "xen0_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_7_grad/MatMul_1"
  op: "MatMul"
  input: "dropout_5/mul_1"
  input: "gradients/packed_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_7_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_7_grad/MatMul"
  input: "^gradients/MatMul_7_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_7_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_7_grad/MatMul"
  input: "^gradients/MatMul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_7_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_7_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_7_grad/MatMul_1"
  input: "^gradients/MatMul_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_7_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_9_grad/MatMul"
  op: "MatMul"
  input: "gradients/packed_2_grad/tuple/control_dependency"
  input: "xmn0_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_9_grad/MatMul_1"
  op: "MatMul"
  input: "dropout_7/mul_1"
  input: "gradients/packed_2_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_9_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_9_grad/MatMul"
  input: "^gradients/MatMul_9_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_9_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_9_grad/MatMul"
  input: "^gradients/MatMul_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_9_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_9_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_9_grad/MatMul_1"
  input: "^gradients/MatMul_9_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_9_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_10_grad/MatMul"
  op: "MatMul"
  input: "gradients/packed_2_grad/tuple/control_dependency_1"
  input: "xmn0_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_10_grad/MatMul_1"
  op: "MatMul"
  input: "dropout_8/mul_1"
  input: "gradients/packed_2_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_10_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_10_grad/MatMul"
  input: "^gradients/MatMul_10_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_10_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_10_grad/MatMul"
  input: "^gradients/MatMul_10_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_10_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_10_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_10_grad/MatMul_1"
  input: "^gradients/MatMul_10_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_10_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_4/mul_1_grad/Shape"
  op: "Shape"
  input: "dropout_4/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_4/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_4/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_4/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_4/mul_1_grad/Shape"
  input: "gradients/dropout_4/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_4/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/MatMul_6_grad/tuple/control_dependency"
  input: "dropout_4/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_4/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_4/mul_1_grad/Mul"
  input: "gradients/dropout_4/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_4/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_4/mul_1_grad/Sum"
  input: "gradients/dropout_4/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_4/mul_1_grad/Mul_1"
  op: "Mul"
  input: "dropout_4/mul"
  input: "gradients/MatMul_6_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_4/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_4/mul_1_grad/Mul_1"
  input: "gradients/dropout_4/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_4/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_4/mul_1_grad/Sum_1"
  input: "gradients/dropout_4/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_4/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_4/mul_1_grad/Reshape"
  input: "^gradients/dropout_4/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_4/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_4/mul_1_grad/Reshape"
  input: "^gradients/dropout_4/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_4/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_4/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_4/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_4/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_4/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_5/mul_1_grad/Shape"
  op: "Shape"
  input: "dropout_5/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_5/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_5/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_5/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_5/mul_1_grad/Shape"
  input: "gradients/dropout_5/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_5/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/MatMul_7_grad/tuple/control_dependency"
  input: "dropout_5/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_5/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_5/mul_1_grad/Mul"
  input: "gradients/dropout_5/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_5/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_5/mul_1_grad/Sum"
  input: "gradients/dropout_5/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_5/mul_1_grad/Mul_1"
  op: "Mul"
  input: "dropout_5/mul"
  input: "gradients/MatMul_7_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_5/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_5/mul_1_grad/Mul_1"
  input: "gradients/dropout_5/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_5/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_5/mul_1_grad/Sum_1"
  input: "gradients/dropout_5/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_5/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_5/mul_1_grad/Reshape"
  input: "^gradients/dropout_5/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_5/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_5/mul_1_grad/Reshape"
  input: "^gradients/dropout_5/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_5/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_5/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_5/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_5/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_5/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_5"
  op: "AddN"
  input: "gradients/MatMul_6_grad/tuple/control_dependency_1"
  input: "gradients/MatMul_7_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_6_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_7/mul_1_grad/Shape"
  op: "Shape"
  input: "dropout_7/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_7/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_7/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_7/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_7/mul_1_grad/Shape"
  input: "gradients/dropout_7/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_7/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/MatMul_9_grad/tuple/control_dependency"
  input: "dropout_7/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_7/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_7/mul_1_grad/Mul"
  input: "gradients/dropout_7/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_7/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_7/mul_1_grad/Sum"
  input: "gradients/dropout_7/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_7/mul_1_grad/Mul_1"
  op: "Mul"
  input: "dropout_7/mul"
  input: "gradients/MatMul_9_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_7/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_7/mul_1_grad/Mul_1"
  input: "gradients/dropout_7/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_7/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_7/mul_1_grad/Sum_1"
  input: "gradients/dropout_7/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_7/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_7/mul_1_grad/Reshape"
  input: "^gradients/dropout_7/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_7/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_7/mul_1_grad/Reshape"
  input: "^gradients/dropout_7/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_7/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_7/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_7/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_7/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_7/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_8/mul_1_grad/Shape"
  op: "Shape"
  input: "dropout_8/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_8/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_8/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_8/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_8/mul_1_grad/Shape"
  input: "gradients/dropout_8/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_8/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/MatMul_10_grad/tuple/control_dependency"
  input: "dropout_8/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_8/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_8/mul_1_grad/Mul"
  input: "gradients/dropout_8/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_8/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_8/mul_1_grad/Sum"
  input: "gradients/dropout_8/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_8/mul_1_grad/Mul_1"
  op: "Mul"
  input: "dropout_8/mul"
  input: "gradients/MatMul_10_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_8/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_8/mul_1_grad/Mul_1"
  input: "gradients/dropout_8/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_8/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_8/mul_1_grad/Sum_1"
  input: "gradients/dropout_8/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_8/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_8/mul_1_grad/Reshape"
  input: "^gradients/dropout_8/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_8/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_8/mul_1_grad/Reshape"
  input: "^gradients/dropout_8/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_8/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_8/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_8/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_8/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_8/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_6"
  op: "AddN"
  input: "gradients/MatMul_9_grad/tuple/control_dependency_1"
  input: "gradients/MatMul_10_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_9_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_4/mul_grad/Shape"
  op: "Shape"
  input: "Tanh"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_4/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_4/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_4/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_4/mul_grad/Shape"
  input: "gradients/dropout_4/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_4/mul_grad/Mul"
  op: "Mul"
  input: "gradients/dropout_4/mul_1_grad/tuple/control_dependency"
  input: "dropout_4/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_4/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_4/mul_grad/Mul"
  input: "gradients/dropout_4/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_4/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_4/mul_grad/Sum"
  input: "gradients/dropout_4/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_4/mul_grad/Mul_1"
  op: "Mul"
  input: "Tanh"
  input: "gradients/dropout_4/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_4/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_4/mul_grad/Mul_1"
  input: "gradients/dropout_4/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_4/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_4/mul_grad/Sum_1"
  input: "gradients/dropout_4/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_4/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_4/mul_grad/Reshape"
  input: "^gradients/dropout_4/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_4/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_4/mul_grad/Reshape"
  input: "^gradients/dropout_4/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_4/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_4/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_4/mul_grad/Reshape_1"
  input: "^gradients/dropout_4/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_4/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_5/mul_grad/Shape"
  op: "Shape"
  input: "Tanh_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_5/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_5/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_5/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_5/mul_grad/Shape"
  input: "gradients/dropout_5/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_5/mul_grad/Mul"
  op: "Mul"
  input: "gradients/dropout_5/mul_1_grad/tuple/control_dependency"
  input: "dropout_5/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_5/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_5/mul_grad/Mul"
  input: "gradients/dropout_5/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_5/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_5/mul_grad/Sum"
  input: "gradients/dropout_5/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_5/mul_grad/Mul_1"
  op: "Mul"
  input: "Tanh_1"
  input: "gradients/dropout_5/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_5/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_5/mul_grad/Mul_1"
  input: "gradients/dropout_5/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_5/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_5/mul_grad/Sum_1"
  input: "gradients/dropout_5/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_5/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_5/mul_grad/Reshape"
  input: "^gradients/dropout_5/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_5/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_5/mul_grad/Reshape"
  input: "^gradients/dropout_5/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_5/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_5/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_5/mul_grad/Reshape_1"
  input: "^gradients/dropout_5/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_5/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_7/mul_grad/Shape"
  op: "Shape"
  input: "Tanh_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_7/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_7/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_7/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_7/mul_grad/Shape"
  input: "gradients/dropout_7/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_7/mul_grad/Mul"
  op: "Mul"
  input: "gradients/dropout_7/mul_1_grad/tuple/control_dependency"
  input: "dropout_7/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_7/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_7/mul_grad/Mul"
  input: "gradients/dropout_7/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_7/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_7/mul_grad/Sum"
  input: "gradients/dropout_7/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_7/mul_grad/Mul_1"
  op: "Mul"
  input: "Tanh_2"
  input: "gradients/dropout_7/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_7/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_7/mul_grad/Mul_1"
  input: "gradients/dropout_7/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_7/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_7/mul_grad/Sum_1"
  input: "gradients/dropout_7/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_7/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_7/mul_grad/Reshape"
  input: "^gradients/dropout_7/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_7/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_7/mul_grad/Reshape"
  input: "^gradients/dropout_7/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_7/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_7/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_7/mul_grad/Reshape_1"
  input: "^gradients/dropout_7/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_7/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_8/mul_grad/Shape"
  op: "Shape"
  input: "Tanh_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_8/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_8/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_8/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_8/mul_grad/Shape"
  input: "gradients/dropout_8/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_8/mul_grad/Mul"
  op: "Mul"
  input: "gradients/dropout_8/mul_1_grad/tuple/control_dependency"
  input: "dropout_8/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_8/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_8/mul_grad/Mul"
  input: "gradients/dropout_8/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_8/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_8/mul_grad/Sum"
  input: "gradients/dropout_8/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_8/mul_grad/Mul_1"
  op: "Mul"
  input: "Tanh_3"
  input: "gradients/dropout_8/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_8/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_8/mul_grad/Mul_1"
  input: "gradients/dropout_8/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_8/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_8/mul_grad/Sum_1"
  input: "gradients/dropout_8/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_8/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_8/mul_grad/Reshape"
  input: "^gradients/dropout_8/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_8/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_8/mul_grad/Reshape"
  input: "^gradients/dropout_8/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_8/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_8/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_8/mul_grad/Reshape_1"
  input: "^gradients/dropout_8/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_8/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Tanh_grad/TanhGrad"
  op: "TanhGrad"
  input: "Tanh"
  input: "gradients/dropout_4/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Tanh_1_grad/TanhGrad"
  op: "TanhGrad"
  input: "Tanh_1"
  input: "gradients/dropout_5/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Tanh_2_grad/TanhGrad"
  op: "TanhGrad"
  input: "Tanh_2"
  input: "gradients/dropout_7/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Tanh_3_grad/TanhGrad"
  op: "TanhGrad"
  input: "Tanh_3"
  input: "gradients/dropout_8/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/add_1_grad/Shape"
  op: "Shape"
  input: "add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "gradients/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_1_grad/Shape"
  input: "gradients/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/Tanh_grad/TanhGrad"
  input: "gradients/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_1_grad/Sum"
  input: "gradients/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/Tanh_grad/TanhGrad"
  input: "gradients/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_1_grad/Sum_1"
  input: "gradients/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_1_grad/Reshape"
  input: "^gradients/add_1_grad/Reshape_1"
}
node {
  name: "gradients/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_1_grad/Reshape"
  input: "^gradients/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_1_grad/Reshape_1"
  input: "^gradients/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/add_3_grad/Shape"
  op: "Shape"
  input: "add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "gradients/add_3_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_3_grad/Shape"
  input: "gradients/add_3_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/Sum"
  op: "Sum"
  input: "gradients/Tanh_1_grad/TanhGrad"
  input: "gradients/add_3_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_3_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_3_grad/Sum"
  input: "gradients/add_3_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/Sum_1"
  op: "Sum"
  input: "gradients/Tanh_1_grad/TanhGrad"
  input: "gradients/add_3_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_3_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_3_grad/Sum_1"
  input: "gradients/add_3_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_3_grad/Reshape"
  input: "^gradients/add_3_grad/Reshape_1"
}
node {
  name: "gradients/add_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_3_grad/Reshape"
  input: "^gradients/add_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_3_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_3_grad/Reshape_1"
  input: "^gradients/add_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_3_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/add_6_grad/Shape"
  op: "Shape"
  input: "add_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_6_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "gradients/add_6_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_6_grad/Shape"
  input: "gradients/add_6_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_6_grad/Sum"
  op: "Sum"
  input: "gradients/Tanh_2_grad/TanhGrad"
  input: "gradients/add_6_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_6_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_6_grad/Sum"
  input: "gradients/add_6_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_6_grad/Sum_1"
  op: "Sum"
  input: "gradients/Tanh_2_grad/TanhGrad"
  input: "gradients/add_6_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_6_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_6_grad/Sum_1"
  input: "gradients/add_6_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_6_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_6_grad/Reshape"
  input: "^gradients/add_6_grad/Reshape_1"
}
node {
  name: "gradients/add_6_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_6_grad/Reshape"
  input: "^gradients/add_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_6_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_6_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_6_grad/Reshape_1"
  input: "^gradients/add_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_6_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/add_8_grad/Shape"
  op: "Shape"
  input: "add_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_8_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "gradients/add_8_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_8_grad/Shape"
  input: "gradients/add_8_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_8_grad/Sum"
  op: "Sum"
  input: "gradients/Tanh_3_grad/TanhGrad"
  input: "gradients/add_8_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_8_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_8_grad/Sum"
  input: "gradients/add_8_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_8_grad/Sum_1"
  op: "Sum"
  input: "gradients/Tanh_3_grad/TanhGrad"
  input: "gradients/add_8_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_8_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_8_grad/Sum_1"
  input: "gradients/add_8_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_8_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_8_grad/Reshape"
  input: "^gradients/add_8_grad/Reshape_1"
}
node {
  name: "gradients/add_8_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_8_grad/Reshape"
  input: "^gradients/add_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_8_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_8_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_8_grad/Reshape_1"
  input: "^gradients/add_8_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_8_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/add_grad/Shape"
  op: "Shape"
  input: "MatMul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/Shape_1"
  op: "Shape"
  input: "mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_grad/Shape"
  input: "gradients/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/Sum"
  op: "Sum"
  input: "gradients/add_1_grad/tuple/control_dependency"
  input: "gradients/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_grad/Sum"
  input: "gradients/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/add_1_grad/tuple/control_dependency"
  input: "gradients/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_grad/Sum_1"
  input: "gradients/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_grad/Reshape"
  input: "^gradients/add_grad/Reshape_1"
}
node {
  name: "gradients/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_grad/Reshape"
  input: "^gradients/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_grad/Reshape_1"
  input: "^gradients/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/add_2_grad/Shape"
  op: "Shape"
  input: "MatMul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/Shape_1"
  op: "Shape"
  input: "mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_2_grad/Shape"
  input: "gradients/add_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/Sum"
  op: "Sum"
  input: "gradients/add_3_grad/tuple/control_dependency"
  input: "gradients/add_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_2_grad/Sum"
  input: "gradients/add_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/add_3_grad/tuple/control_dependency"
  input: "gradients/add_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_2_grad/Sum_1"
  input: "gradients/add_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_2_grad/Reshape"
  input: "^gradients/add_2_grad/Reshape_1"
}
node {
  name: "gradients/add_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_2_grad/Reshape"
  input: "^gradients/add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_2_grad/Reshape_1"
  input: "^gradients/add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_7"
  op: "AddN"
  input: "gradients/add_1_grad/tuple/control_dependency_1"
  input: "gradients/add_3_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/add_5_grad/Shape"
  op: "Shape"
  input: "MatMul_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/Shape_1"
  op: "Shape"
  input: "mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_5_grad/Shape"
  input: "gradients/add_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/Sum"
  op: "Sum"
  input: "gradients/add_6_grad/tuple/control_dependency"
  input: "gradients/add_5_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_5_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_5_grad/Sum"
  input: "gradients/add_5_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/Sum_1"
  op: "Sum"
  input: "gradients/add_6_grad/tuple/control_dependency"
  input: "gradients/add_5_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_5_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_5_grad/Sum_1"
  input: "gradients/add_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_5_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_5_grad/Reshape"
  input: "^gradients/add_5_grad/Reshape_1"
}
node {
  name: "gradients/add_5_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_5_grad/Reshape"
  input: "^gradients/add_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_5_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_5_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_5_grad/Reshape_1"
  input: "^gradients/add_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_5_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/add_7_grad/Shape"
  op: "Shape"
  input: "MatMul_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_7_grad/Shape_1"
  op: "Shape"
  input: "mul_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_7_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_7_grad/Shape"
  input: "gradients/add_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_7_grad/Sum"
  op: "Sum"
  input: "gradients/add_8_grad/tuple/control_dependency"
  input: "gradients/add_7_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_7_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_7_grad/Sum"
  input: "gradients/add_7_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_7_grad/Sum_1"
  op: "Sum"
  input: "gradients/add_8_grad/tuple/control_dependency"
  input: "gradients/add_7_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_7_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_7_grad/Sum_1"
  input: "gradients/add_7_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/add_7_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_7_grad/Reshape"
  input: "^gradients/add_7_grad/Reshape_1"
}
node {
  name: "gradients/add_7_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_7_grad/Reshape"
  input: "^gradients/add_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_7_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_7_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_7_grad/Reshape_1"
  input: "^gradients/add_7_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_7_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_8"
  op: "AddN"
  input: "gradients/add_6_grad/tuple/control_dependency_1"
  input: "gradients/add_8_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_6_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_grad/Shape"
  op: "Shape"
  input: "MatMul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_2/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_grad/Shape"
  input: "gradients/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/Mul"
  op: "Mul"
  input: "gradients/add_grad/tuple/control_dependency_1"
  input: "dropout_2/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/Sum"
  op: "Sum"
  input: "gradients/mul_grad/Mul"
  input: "gradients/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_grad/Sum"
  input: "gradients/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/Mul_1"
  op: "Mul"
  input: "MatMul_2"
  input: "gradients/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_grad/Mul_1"
  input: "gradients/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_grad/Sum_1"
  input: "gradients/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_grad/Reshape"
  input: "^gradients/mul_grad/Reshape_1"
}
node {
  name: "gradients/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_grad/Reshape"
  input: "^gradients/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_grad/Reshape_1"
  input: "^gradients/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_1_grad/Shape"
  op: "Shape"
  input: "MatMul_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_3/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_1_grad/Shape"
  input: "gradients/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/add_2_grad/tuple/control_dependency_1"
  input: "dropout_3/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/mul_1_grad/Mul"
  input: "gradients/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_1_grad/Sum"
  input: "gradients/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_1_grad/Mul_1"
  op: "Mul"
  input: "MatMul_4"
  input: "gradients/add_2_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_1_grad/Mul_1"
  input: "gradients/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_1_grad/Sum_1"
  input: "gradients/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_1_grad/Reshape"
  input: "^gradients/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_1_grad/Reshape"
  input: "^gradients/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_1_grad/Reshape_1"
  input: "^gradients/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_5_grad/Shape"
  op: "Shape"
  input: "MatMul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_5_grad/Shape_1"
  op: "Shape"
  input: "dropout_2/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_5_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_5_grad/Shape"
  input: "gradients/mul_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_5_grad/Mul"
  op: "Mul"
  input: "gradients/add_5_grad/tuple/control_dependency_1"
  input: "dropout_2/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_5_grad/Sum"
  op: "Sum"
  input: "gradients/mul_5_grad/Mul"
  input: "gradients/mul_5_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_5_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_5_grad/Sum"
  input: "gradients/mul_5_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_5_grad/Mul_1"
  op: "Mul"
  input: "MatMul_2"
  input: "gradients/add_5_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_5_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_5_grad/Mul_1"
  input: "gradients/mul_5_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_5_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_5_grad/Sum_1"
  input: "gradients/mul_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_5_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_5_grad/Reshape"
  input: "^gradients/mul_5_grad/Reshape_1"
}
node {
  name: "gradients/mul_5_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_5_grad/Reshape"
  input: "^gradients/mul_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_5_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_5_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_5_grad/Reshape_1"
  input: "^gradients/mul_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_5_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_6_grad/Shape"
  op: "Shape"
  input: "MatMul_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_6_grad/Shape_1"
  op: "Shape"
  input: "dropout_3/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_6_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_6_grad/Shape"
  input: "gradients/mul_6_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_6_grad/Mul"
  op: "Mul"
  input: "gradients/add_7_grad/tuple/control_dependency_1"
  input: "dropout_3/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_6_grad/Sum"
  op: "Sum"
  input: "gradients/mul_6_grad/Mul"
  input: "gradients/mul_6_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_6_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_6_grad/Sum"
  input: "gradients/mul_6_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_6_grad/Mul_1"
  op: "Mul"
  input: "MatMul_4"
  input: "gradients/add_7_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_6_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_6_grad/Mul_1"
  input: "gradients/mul_6_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_6_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_6_grad/Sum_1"
  input: "gradients/mul_6_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_6_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_6_grad/Reshape"
  input: "^gradients/mul_6_grad/Reshape_1"
}
node {
  name: "gradients/mul_6_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_6_grad/Reshape"
  input: "^gradients/mul_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_6_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_6_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_6_grad/Reshape_1"
  input: "^gradients/mul_6_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_6_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_9"
  op: "AddN"
  input: "gradients/add_grad/tuple/control_dependency"
  input: "gradients/add_2_grad/tuple/control_dependency"
  input: "gradients/mul_grad/tuple/control_dependency"
  input: "gradients/mul_5_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/MatMul_2_grad/MatMul"
  op: "MatMul"
  input: "gradients/AddN_9"
  input: "Xen0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_2_grad/MatMul_1"
  op: "MatMul"
  input: "dropout/en_h_drop/mul_1"
  input: "gradients/AddN_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_2_grad/MatMul"
  input: "^gradients/MatMul_2_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_2_grad/MatMul"
  input: "^gradients/MatMul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_2_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_2_grad/MatMul_1"
  input: "^gradients/MatMul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_2_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_10"
  op: "AddN"
  input: "gradients/mul_grad/tuple/control_dependency_1"
  input: "gradients/mul_5_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/mul_1_grad/Shape"
  op: "Shape"
  input: "dropout_2/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_2/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_2/mul_1_grad/Shape"
  input: "gradients/dropout_2/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/AddN_10"
  input: "dropout_2/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_2/mul_1_grad/Mul"
  input: "gradients/dropout_2/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_2/mul_1_grad/Sum"
  input: "gradients/dropout_2/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/mul_1_grad/Mul_1"
  op: "Mul"
  input: "dropout_2/mul"
  input: "gradients/AddN_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_2/mul_1_grad/Mul_1"
  input: "gradients/dropout_2/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_2/mul_1_grad/Sum_1"
  input: "gradients/dropout_2/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_2/mul_1_grad/Reshape"
  input: "^gradients/dropout_2/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_2/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_2/mul_1_grad/Reshape"
  input: "^gradients/dropout_2/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_2/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_2/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_11"
  op: "AddN"
  input: "gradients/add_5_grad/tuple/control_dependency"
  input: "gradients/add_7_grad/tuple/control_dependency"
  input: "gradients/mul_1_grad/tuple/control_dependency"
  input: "gradients/mul_6_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_5_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/MatMul_4_grad/MatMul"
  op: "MatMul"
  input: "gradients/AddN_11"
  input: "Xmn0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_4_grad/MatMul_1"
  op: "MatMul"
  input: "dropout_1/mn_h_drop/mul_1"
  input: "gradients/AddN_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_4_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_4_grad/MatMul"
  input: "^gradients/MatMul_4_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_4_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_4_grad/MatMul"
  input: "^gradients/MatMul_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_4_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_4_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_4_grad/MatMul_1"
  input: "^gradients/MatMul_4_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_4_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_12"
  op: "AddN"
  input: "gradients/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/mul_6_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/mul_1_grad/Shape"
  op: "Shape"
  input: "dropout_3/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_3/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_3/mul_1_grad/Shape"
  input: "gradients/dropout_3/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/AddN_12"
  input: "dropout_3/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_3/mul_1_grad/Mul"
  input: "gradients/dropout_3/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_3/mul_1_grad/Sum"
  input: "gradients/dropout_3/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/mul_1_grad/Mul_1"
  op: "Mul"
  input: "dropout_3/mul"
  input: "gradients/AddN_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_3/mul_1_grad/Mul_1"
  input: "gradients/dropout_3/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_3/mul_1_grad/Sum_1"
  input: "gradients/dropout_3/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_3/mul_1_grad/Reshape"
  input: "^gradients/dropout_3/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_3/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_3/mul_1_grad/Reshape"
  input: "^gradients/dropout_3/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_3/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_3/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/mul_grad/Shape"
  op: "Shape"
  input: "Sigmoid"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_2/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_2/mul_grad/Shape"
  input: "gradients/dropout_2/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/mul_grad/Mul"
  op: "Mul"
  input: "gradients/dropout_2/mul_1_grad/tuple/control_dependency"
  input: "dropout_2/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_2/mul_grad/Mul"
  input: "gradients/dropout_2/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_2/mul_grad/Sum"
  input: "gradients/dropout_2/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/mul_grad/Mul_1"
  op: "Mul"
  input: "Sigmoid"
  input: "gradients/dropout_2/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_2/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_2/mul_grad/Mul_1"
  input: "gradients/dropout_2/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_2/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_2/mul_grad/Sum_1"
  input: "gradients/dropout_2/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_2/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_2/mul_grad/Reshape"
  input: "^gradients/dropout_2/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_2/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_2/mul_grad/Reshape"
  input: "^gradients/dropout_2/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_2/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_2/mul_grad/Reshape_1"
  input: "^gradients/dropout_2/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_2/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/mul_grad/Shape"
  op: "Shape"
  input: "Sigmoid_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_3/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_3/mul_grad/Shape"
  input: "gradients/dropout_3/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/mul_grad/Mul"
  op: "Mul"
  input: "gradients/dropout_3/mul_1_grad/tuple/control_dependency"
  input: "dropout_3/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_3/mul_grad/Mul"
  input: "gradients/dropout_3/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_3/mul_grad/Sum"
  input: "gradients/dropout_3/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/mul_grad/Mul_1"
  op: "Mul"
  input: "Sigmoid_1"
  input: "gradients/dropout_3/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_3/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_3/mul_grad/Mul_1"
  input: "gradients/dropout_3/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_3/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_3/mul_grad/Sum_1"
  input: "gradients/dropout_3/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_3/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_3/mul_grad/Reshape"
  input: "^gradients/dropout_3/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_3/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_3/mul_grad/Reshape"
  input: "^gradients/dropout_3/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_3/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_3/mul_grad/Reshape_1"
  input: "^gradients/dropout_3/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_3/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Sigmoid_grad/SigmoidGrad"
  op: "SigmoidGrad"
  input: "Sigmoid"
  input: "gradients/dropout_2/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Sigmoid_1_grad/SigmoidGrad"
  op: "SigmoidGrad"
  input: "Sigmoid_1"
  input: "gradients/dropout_3/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/Sigmoid_grad/SigmoidGrad"
  input: "Ten/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "dropout/en_h_drop/mul_1"
  input: "gradients/Sigmoid_grad/SigmoidGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_grad/MatMul"
  input: "^gradients/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_grad/MatMul"
  input: "^gradients/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_grad/MatMul_1"
  input: "^gradients/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_1_grad/MatMul"
  op: "MatMul"
  input: "gradients/Sigmoid_1_grad/SigmoidGrad"
  input: "Tmn/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_1_grad/MatMul_1"
  op: "MatMul"
  input: "dropout_1/mn_h_drop/mul_1"
  input: "gradients/Sigmoid_1_grad/SigmoidGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_1_grad/MatMul"
  input: "^gradients/MatMul_1_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_1_grad/MatMul"
  input: "^gradients/MatMul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_1_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_1_grad/MatMul_1"
  input: "^gradients/MatMul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_1_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_13"
  op: "AddN"
  input: "gradients/Mul_4_grad/tuple/control_dependency"
  input: "gradients/concat_2_grad/tuple/control_dependency"
  input: "gradients/MatMul_3_grad/tuple/control_dependency"
  input: "gradients/MatMul_2_grad/tuple/control_dependency"
  input: "gradients/MatMul_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 5
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_4_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/Shape"
  op: "Shape"
  input: "dropout/en_h_drop/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout/en_h_drop/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout/en_h_drop/mul_1_grad/Shape"
  input: "gradients/dropout/en_h_drop/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/AddN_13"
  input: "dropout/en_h_drop/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout/en_h_drop/mul_1_grad/Mul"
  input: "gradients/dropout/en_h_drop/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout/en_h_drop/mul_1_grad/Sum"
  input: "gradients/dropout/en_h_drop/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/Mul_1"
  op: "Mul"
  input: "dropout/en_h_drop/mul"
  input: "gradients/AddN_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout/en_h_drop/mul_1_grad/Mul_1"
  input: "gradients/dropout/en_h_drop/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout/en_h_drop/mul_1_grad/Sum_1"
  input: "gradients/dropout/en_h_drop/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout/en_h_drop/mul_1_grad/Reshape"
  input: "^gradients/dropout/en_h_drop/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout/en_h_drop/mul_1_grad/Reshape"
  input: "^gradients/dropout/en_h_drop/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/en_h_drop/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout/en_h_drop/mul_1_grad/Reshape_1"
  input: "^gradients/dropout/en_h_drop/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/en_h_drop/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_14"
  op: "AddN"
  input: "gradients/Mul_9_grad/tuple/control_dependency"
  input: "gradients/concat_3_grad/tuple/control_dependency"
  input: "gradients/MatMul_5_grad/tuple/control_dependency"
  input: "gradients/MatMul_4_grad/tuple/control_dependency"
  input: "gradients/MatMul_1_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 5
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_9_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/Shape"
  op: "Shape"
  input: "dropout_1/mn_h_drop/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dropout_1/mn_h_drop/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/Shape"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/AddN_14"
  input: "dropout_1/mn_h_drop/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/Mul"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/Sum"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/Mul_1"
  op: "Mul"
  input: "dropout_1/mn_h_drop/mul"
  input: "gradients/AddN_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/Mul_1"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/Sum_1"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_1/mn_h_drop/mul_1_grad/Reshape"
  input: "^gradients/dropout_1/mn_h_drop/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/Reshape"
  input: "^gradients/dropout_1/mn_h_drop/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/mn_h_drop/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/Reshape_1"
  input: "^gradients/dropout_1/mn_h_drop/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/mn_h_drop/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/Shape"
  op: "Shape"
  input: "Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout/en_h_drop/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout/en_h_drop/mul_grad/Shape"
  input: "gradients/dropout/en_h_drop/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/Mul"
  op: "Mul"
  input: "gradients/dropout/en_h_drop/mul_1_grad/tuple/control_dependency"
  input: "dropout/en_h_drop/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout/en_h_drop/mul_grad/Mul"
  input: "gradients/dropout/en_h_drop/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout/en_h_drop/mul_grad/Sum"
  input: "gradients/dropout/en_h_drop/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/Mul_1"
  op: "Mul"
  input: "Reshape"
  input: "gradients/dropout/en_h_drop/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout/en_h_drop/mul_grad/Mul_1"
  input: "gradients/dropout/en_h_drop/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout/en_h_drop/mul_grad/Sum_1"
  input: "gradients/dropout/en_h_drop/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout/en_h_drop/mul_grad/Reshape"
  input: "^gradients/dropout/en_h_drop/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout/en_h_drop/mul_grad/Reshape"
  input: "^gradients/dropout/en_h_drop/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/en_h_drop/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout/en_h_drop/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout/en_h_drop/mul_grad/Reshape_1"
  input: "^gradients/dropout/en_h_drop/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout/en_h_drop/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/Shape"
  op: "Shape"
  input: "Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_1/mn_h_drop/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/Shape"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/Mul"
  op: "Mul"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/tuple/control_dependency"
  input: "dropout_1/mn_h_drop/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/Sum"
  op: "Sum"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/Mul"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/Sum"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/Mul_1"
  op: "Mul"
  input: "Reshape_1"
  input: "gradients/dropout_1/mn_h_drop/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/Mul_1"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/Sum_1"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dropout_1/mn_h_drop/mul_grad/Reshape"
  input: "^gradients/dropout_1/mn_h_drop/mul_grad/Reshape_1"
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/Reshape"
  input: "^gradients/dropout_1/mn_h_drop/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/mn_h_drop/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dropout_1/mn_h_drop/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/Reshape_1"
  input: "^gradients/dropout_1/mn_h_drop/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dropout_1/mn_h_drop/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Reshape_grad/Shape"
  op: "Shape"
  input: "concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout/en_h_drop/mul_grad/tuple/control_dependency"
  input: "gradients/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Reshape_1_grad/Shape"
  op: "Shape"
  input: "concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Reshape_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/dropout_1/mn_h_drop/mul_grad/tuple/control_dependency"
  input: "gradients/Reshape_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_grad/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/concat_grad/mod"
  op: "FloorMod"
  input: "concat/axis"
  input: "gradients/concat_grad/Rank"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_grad/Shape"
  op: "Shape"
  input: "conv-maxpool-0/en_pool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_grad/ShapeN"
  op: "ShapeN"
  input: "conv-maxpool-0/en_pool"
  input: "conv-maxpool-1/en_pool"
  input: "conv-maxpool-2/en_pool"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_grad/ConcatOffset"
  op: "ConcatOffset"
  input: "gradients/concat_grad/mod"
  input: "gradients/concat_grad/ShapeN"
  input: "gradients/concat_grad/ShapeN:1"
  input: "gradients/concat_grad/ShapeN:2"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
}
node {
  name: "gradients/concat_grad/Slice"
  op: "Slice"
  input: "gradients/Reshape_grad/Reshape"
  input: "gradients/concat_grad/ConcatOffset"
  input: "gradients/concat_grad/ShapeN"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_grad/Slice_1"
  op: "Slice"
  input: "gradients/Reshape_grad/Reshape"
  input: "gradients/concat_grad/ConcatOffset:1"
  input: "gradients/concat_grad/ShapeN:1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_grad/Slice_2"
  op: "Slice"
  input: "gradients/Reshape_grad/Reshape"
  input: "gradients/concat_grad/ConcatOffset:2"
  input: "gradients/concat_grad/ShapeN:2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/concat_grad/Slice"
  input: "^gradients/concat_grad/Slice_1"
  input: "^gradients/concat_grad/Slice_2"
}
node {
  name: "gradients/concat_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/concat_grad/Slice"
  input: "^gradients/concat_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/concat_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/concat_grad/Slice_1"
  input: "^gradients/concat_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/concat_grad/tuple/control_dependency_2"
  op: "Identity"
  input: "gradients/concat_grad/Slice_2"
  input: "^gradients/concat_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_grad/Slice_2"
      }
    }
  }
}
node {
  name: "gradients/concat_1_grad/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "gradients/concat_1_grad/mod"
  op: "FloorMod"
  input: "concat_1/axis"
  input: "gradients/concat_1_grad/Rank"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_1_grad/Shape"
  op: "Shape"
  input: "conv-maxpool-0_1/mn_pool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_1_grad/ShapeN"
  op: "ShapeN"
  input: "conv-maxpool-0_1/mn_pool"
  input: "conv-maxpool-1_1/mn_pool"
  input: "conv-maxpool-2_1/mn_pool"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_1_grad/ConcatOffset"
  op: "ConcatOffset"
  input: "gradients/concat_1_grad/mod"
  input: "gradients/concat_1_grad/ShapeN"
  input: "gradients/concat_1_grad/ShapeN:1"
  input: "gradients/concat_1_grad/ShapeN:2"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
}
node {
  name: "gradients/concat_1_grad/Slice"
  op: "Slice"
  input: "gradients/Reshape_1_grad/Reshape"
  input: "gradients/concat_1_grad/ConcatOffset"
  input: "gradients/concat_1_grad/ShapeN"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_1_grad/Slice_1"
  op: "Slice"
  input: "gradients/Reshape_1_grad/Reshape"
  input: "gradients/concat_1_grad/ConcatOffset:1"
  input: "gradients/concat_1_grad/ShapeN:1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_1_grad/Slice_2"
  op: "Slice"
  input: "gradients/Reshape_1_grad/Reshape"
  input: "gradients/concat_1_grad/ConcatOffset:2"
  input: "gradients/concat_1_grad/ShapeN:2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/concat_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/concat_1_grad/Slice"
  input: "^gradients/concat_1_grad/Slice_1"
  input: "^gradients/concat_1_grad/Slice_2"
}
node {
  name: "gradients/concat_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/concat_1_grad/Slice"
  input: "^gradients/concat_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_1_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/concat_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/concat_1_grad/Slice_1"
  input: "^gradients/concat_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_1_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/concat_1_grad/tuple/control_dependency_2"
  op: "Identity"
  input: "gradients/concat_1_grad/Slice_2"
  input: "^gradients/concat_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_1_grad/Slice_2"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-0/en_pool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv-maxpool-0/en_relu"
  input: "conv-maxpool-0/en_pool"
  input: "gradients/concat_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 69
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-1/en_pool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv-maxpool-1/en_relu"
  input: "conv-maxpool-1/en_pool"
  input: "gradients/concat_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 68
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-2/en_pool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv-maxpool-2/en_relu"
  input: "conv-maxpool-2/en_pool"
  input: "gradients/concat_grad/tuple/control_dependency_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 67
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-0_1/mn_pool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv-maxpool-0_1/mn_relu"
  input: "conv-maxpool-0_1/mn_pool"
  input: "gradients/concat_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 65
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-1_1/mn_pool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv-maxpool-1_1/mn_relu"
  input: "conv-maxpool-1_1/mn_pool"
  input: "gradients/concat_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 64
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-2_1/mn_pool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv-maxpool-2_1/mn_relu"
  input: "conv-maxpool-2_1/mn_pool"
  input: "gradients/concat_1_grad/tuple/control_dependency_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 63
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-0/en_relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/conv-maxpool-0/en_pool_grad/MaxPoolGrad"
  input: "conv-maxpool-0/en_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/conv-maxpool-1/en_relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/conv-maxpool-1/en_pool_grad/MaxPoolGrad"
  input: "conv-maxpool-1/en_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/conv-maxpool-2/en_relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/conv-maxpool-2/en_pool_grad/MaxPoolGrad"
  input: "conv-maxpool-2/en_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/conv-maxpool-0_1/mn_relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/conv-maxpool-0_1/mn_pool_grad/MaxPoolGrad"
  input: "conv-maxpool-0_1/mn_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/conv-maxpool-1_1/mn_relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/conv-maxpool-1_1/mn_pool_grad/MaxPoolGrad"
  input: "conv-maxpool-1_1/mn_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/conv-maxpool-2_1/mn_relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/conv-maxpool-2_1/mn_pool_grad/MaxPoolGrad"
  input: "conv-maxpool-2_1/mn_relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/conv-maxpool-0/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/conv-maxpool-0/en_relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/conv-maxpool-0/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-0/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-0/en_relu_grad/ReluGrad"
}
node {
  name: "gradients/conv-maxpool-0/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-0/en_relu_grad/ReluGrad"
  input: "^gradients/conv-maxpool-0/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-0/en_relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-0/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-0/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-0/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-0/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/conv-maxpool-1/en_relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/conv-maxpool-1/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-1/en_relu_grad/ReluGrad"
}
node {
  name: "gradients/conv-maxpool-1/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-1/en_relu_grad/ReluGrad"
  input: "^gradients/conv-maxpool-1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-1/en_relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-1/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-1/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/conv-maxpool-2/en_relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/conv-maxpool-2/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-2/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-2/en_relu_grad/ReluGrad"
}
node {
  name: "gradients/conv-maxpool-2/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-2/en_relu_grad/ReluGrad"
  input: "^gradients/conv-maxpool-2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-2/en_relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-2/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-2/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-2/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-0_1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/conv-maxpool-0_1/mn_relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/conv-maxpool-0_1/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-0_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-0_1/mn_relu_grad/ReluGrad"
}
node {
  name: "gradients/conv-maxpool-0_1/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-0_1/mn_relu_grad/ReluGrad"
  input: "^gradients/conv-maxpool-0_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-0_1/mn_relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-0_1/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-0_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-0_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-0_1/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-1_1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/conv-maxpool-1_1/mn_relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/conv-maxpool-1_1/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-1_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-1_1/mn_relu_grad/ReluGrad"
}
node {
  name: "gradients/conv-maxpool-1_1/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-1_1/mn_relu_grad/ReluGrad"
  input: "^gradients/conv-maxpool-1_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-1_1/mn_relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-1_1/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-1_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-1_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-1_1/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-2_1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/conv-maxpool-2_1/mn_relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/conv-maxpool-2_1/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-2_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-2_1/mn_relu_grad/ReluGrad"
}
node {
  name: "gradients/conv-maxpool-2_1/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-2_1/mn_relu_grad/ReluGrad"
  input: "^gradients/conv-maxpool-2_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-2_1/mn_relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-2_1/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-2_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/conv-maxpool-2_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-2_1/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-0/conv_grad/ShapeN"
  op: "ShapeN"
  input: "transpose"
  input: "conv-maxpool-0/en_W/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/conv-maxpool-0/conv_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/conv-maxpool-0/conv_grad/ShapeN"
  input: "conv-maxpool-0/en_W/read"
  input: "gradients/conv-maxpool-0/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-0/conv_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "transpose"
  input: "gradients/conv-maxpool-0/conv_grad/ShapeN:1"
  input: "gradients/conv-maxpool-0/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-0/conv_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-0/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-0/conv_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/conv-maxpool-0/conv_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-0/conv_grad/Conv2DBackpropInput"
  input: "^gradients/conv-maxpool-0/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-0/conv_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-0/conv_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-0/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-0/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-0/conv_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-1/conv_grad/ShapeN"
  op: "ShapeN"
  input: "transpose"
  input: "conv-maxpool-1/en_W/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/conv-maxpool-1/conv_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/conv-maxpool-1/conv_grad/ShapeN"
  input: "conv-maxpool-1/en_W/read"
  input: "gradients/conv-maxpool-1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-1/conv_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "transpose"
  input: "gradients/conv-maxpool-1/conv_grad/ShapeN:1"
  input: "gradients/conv-maxpool-1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-1/conv_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-1/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-1/conv_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/conv-maxpool-1/conv_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-1/conv_grad/Conv2DBackpropInput"
  input: "^gradients/conv-maxpool-1/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-1/conv_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-1/conv_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-1/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-1/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-1/conv_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-2/conv_grad/ShapeN"
  op: "ShapeN"
  input: "transpose"
  input: "conv-maxpool-2/en_W/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/conv-maxpool-2/conv_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/conv-maxpool-2/conv_grad/ShapeN"
  input: "conv-maxpool-2/en_W/read"
  input: "gradients/conv-maxpool-2/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-2/conv_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "transpose"
  input: "gradients/conv-maxpool-2/conv_grad/ShapeN:1"
  input: "gradients/conv-maxpool-2/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-2/conv_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-2/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-2/conv_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/conv-maxpool-2/conv_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-2/conv_grad/Conv2DBackpropInput"
  input: "^gradients/conv-maxpool-2/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-2/conv_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-2/conv_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-2/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-2/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-2/conv_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-0_1/conv_grad/ShapeN"
  op: "ShapeN"
  input: "transpose_1"
  input: "conv-maxpool-0_1/mn_W/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/conv-maxpool-0_1/conv_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/conv-maxpool-0_1/conv_grad/ShapeN"
  input: "conv-maxpool-0_1/mn_W/read"
  input: "gradients/conv-maxpool-0_1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-0_1/conv_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "transpose_1"
  input: "gradients/conv-maxpool-0_1/conv_grad/ShapeN:1"
  input: "gradients/conv-maxpool-0_1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-0_1/conv_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-0_1/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-0_1/conv_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/conv-maxpool-0_1/conv_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-0_1/conv_grad/Conv2DBackpropInput"
  input: "^gradients/conv-maxpool-0_1/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-0_1/conv_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-0_1/conv_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-0_1/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-0_1/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-0_1/conv_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-1_1/conv_grad/ShapeN"
  op: "ShapeN"
  input: "transpose_1"
  input: "conv-maxpool-1_1/mn_W/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/conv-maxpool-1_1/conv_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/conv-maxpool-1_1/conv_grad/ShapeN"
  input: "conv-maxpool-1_1/mn_W/read"
  input: "gradients/conv-maxpool-1_1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-1_1/conv_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "transpose_1"
  input: "gradients/conv-maxpool-1_1/conv_grad/ShapeN:1"
  input: "gradients/conv-maxpool-1_1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-1_1/conv_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-1_1/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-1_1/conv_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/conv-maxpool-1_1/conv_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-1_1/conv_grad/Conv2DBackpropInput"
  input: "^gradients/conv-maxpool-1_1/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-1_1/conv_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-1_1/conv_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-1_1/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-1_1/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-1_1/conv_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-2_1/conv_grad/ShapeN"
  op: "ShapeN"
  input: "transpose_1"
  input: "conv-maxpool-2_1/mn_W/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/conv-maxpool-2_1/conv_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/conv-maxpool-2_1/conv_grad/ShapeN"
  input: "conv-maxpool-2_1/mn_W/read"
  input: "gradients/conv-maxpool-2_1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-2_1/conv_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "transpose_1"
  input: "gradients/conv-maxpool-2_1/conv_grad/ShapeN:1"
  input: "gradients/conv-maxpool-2_1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/conv-maxpool-2_1/conv_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/conv-maxpool-2_1/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-2_1/conv_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/conv-maxpool-2_1/conv_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/conv-maxpool-2_1/conv_grad/Conv2DBackpropInput"
  input: "^gradients/conv-maxpool-2_1/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-2_1/conv_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/conv-maxpool-2_1/conv_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/conv-maxpool-2_1/conv_grad/Conv2DBackpropFilter"
  input: "^gradients/conv-maxpool-2_1/conv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-2_1/conv_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/AddN_15"
  op: "AddN"
  input: "gradients/conv-maxpool-0/conv_grad/tuple/control_dependency"
  input: "gradients/conv-maxpool-1/conv_grad/tuple/control_dependency"
  input: "gradients/conv-maxpool-2/conv_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-0/conv_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/transpose_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_grad/transpose"
  op: "Transpose"
  input: "gradients/AddN_15"
  input: "gradients/transpose_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AddN_16"
  op: "AddN"
  input: "gradients/conv-maxpool-0_1/conv_grad/tuple/control_dependency"
  input: "gradients/conv-maxpool-1_1/conv_grad/tuple/control_dependency"
  input: "gradients/conv-maxpool-2_1/conv_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/conv-maxpool-0_1/conv_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/transpose_1_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_1_grad/transpose"
  op: "Transpose"
  input: "gradients/AddN_16"
  input: "gradients/transpose_1_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Cast/x_grad/unstack"
  op: "Unpack"
  input: "gradients/transpose_grad/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
  attr {
    key: "num"
    value {
      i: 1
    }
  }
}
node {
  name: "gradients/Cast_1/x_grad/unstack"
  op: "Unpack"
  input: "gradients/transpose_1_grad/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
  attr {
    key: "num"
    value {
      i: 1
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/Shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "pJ\000\000\000\000\000\000,\001\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/Cast"
  op: "Cast"
  input: "gradients/embed/embedding_lookup_grad/Shape"
  attr {
    key: "DstT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/Size"
  op: "Size"
  input: "en_input_x"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/ExpandDims/dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/ExpandDims"
  op: "ExpandDims"
  input: "gradients/embed/embedding_lookup_grad/Size"
  input: "gradients/embed/embedding_lookup_grad/ExpandDims/dim"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/strided_slice"
  op: "StridedSlice"
  input: "gradients/embed/embedding_lookup_grad/Cast"
  input: "gradients/embed/embedding_lookup_grad/strided_slice/stack"
  input: "gradients/embed/embedding_lookup_grad/strided_slice/stack_1"
  input: "gradients/embed/embedding_lookup_grad/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/concat"
  op: "ConcatV2"
  input: "gradients/embed/embedding_lookup_grad/ExpandDims"
  input: "gradients/embed/embedding_lookup_grad/strided_slice"
  input: "gradients/embed/embedding_lookup_grad/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/Reshape"
  op: "Reshape"
  input: "gradients/Cast/x_grad/unstack"
  input: "gradients/embed/embedding_lookup_grad/concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/embed/embedding_lookup_grad/Reshape_1"
  op: "Reshape"
  input: "en_input_x"
  input: "gradients/embed/embedding_lookup_grad/ExpandDims"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/Shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\217K\000\000\000\000\000\000,\001\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/Cast"
  op: "Cast"
  input: "gradients/embed_1/embedding_lookup_grad/Shape"
  attr {
    key: "DstT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/Size"
  op: "Size"
  input: "mn_input_x"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/ExpandDims/dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/ExpandDims"
  op: "ExpandDims"
  input: "gradients/embed_1/embedding_lookup_grad/Size"
  input: "gradients/embed_1/embedding_lookup_grad/ExpandDims/dim"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/strided_slice"
  op: "StridedSlice"
  input: "gradients/embed_1/embedding_lookup_grad/Cast"
  input: "gradients/embed_1/embedding_lookup_grad/strided_slice/stack"
  input: "gradients/embed_1/embedding_lookup_grad/strided_slice/stack_1"
  input: "gradients/embed_1/embedding_lookup_grad/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/concat"
  op: "ConcatV2"
  input: "gradients/embed_1/embedding_lookup_grad/ExpandDims"
  input: "gradients/embed_1/embedding_lookup_grad/strided_slice"
  input: "gradients/embed_1/embedding_lookup_grad/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/Reshape"
  op: "Reshape"
  input: "gradients/Cast_1/x_grad/unstack"
  input: "gradients/embed_1/embedding_lookup_grad/concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/embed_1/embedding_lookup_grad/Reshape_1"
  op: "Reshape"
  input: "mn_input_x"
  input: "gradients/embed_1/embedding_lookup_grad/ExpandDims"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm/mul"
  op: "Mul"
  input: "gradients/embed/embedding_lookup_grad/Reshape"
  input: "gradients/embed/embedding_lookup_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm/Sum"
  op: "Sum"
  input: "clip_by_norm/mul"
  input: "clip_by_norm/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm/Greater"
  op: "Greater"
  input: "clip_by_norm/Sum"
  input: "clip_by_norm/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm/ones_like"
  op: "Fill"
  input: "clip_by_norm/ones_like/Shape"
  input: "clip_by_norm/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm/Select"
  op: "Select"
  input: "clip_by_norm/Greater"
  input: "clip_by_norm/Sum"
  input: "clip_by_norm/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm/Select_1"
  op: "Select"
  input: "clip_by_norm/Greater"
  input: "clip_by_norm/Sqrt"
  input: "clip_by_norm/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm/mul_1"
  op: "Mul"
  input: "gradients/embed/embedding_lookup_grad/Reshape"
  input: "clip_by_norm/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm/Maximum"
  op: "Maximum"
  input: "clip_by_norm/Select_1"
  input: "clip_by_norm/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm/truediv"
  op: "RealDiv"
  input: "clip_by_norm/mul_1"
  input: "clip_by_norm/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm"
  op: "Identity"
  input: "clip_by_norm/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_1/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-0/conv_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-0/conv_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_1/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_1/Sum"
  op: "Sum"
  input: "clip_by_norm_1/mul"
  input: "clip_by_norm_1/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_1/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_1/Greater"
  op: "Greater"
  input: "clip_by_norm_1/Sum"
  input: "clip_by_norm_1/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_1/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_1/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_1/ones_like"
  op: "Fill"
  input: "clip_by_norm_1/ones_like/Shape"
  input: "clip_by_norm_1/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_1/Select"
  op: "Select"
  input: "clip_by_norm_1/Greater"
  input: "clip_by_norm_1/Sum"
  input: "clip_by_norm_1/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_1/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_1/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_1/Select_1"
  op: "Select"
  input: "clip_by_norm_1/Greater"
  input: "clip_by_norm_1/Sqrt"
  input: "clip_by_norm_1/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_1/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_1/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-0/conv_grad/tuple/control_dependency_1"
  input: "clip_by_norm_1/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_1/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_1/Maximum"
  op: "Maximum"
  input: "clip_by_norm_1/Select_1"
  input: "clip_by_norm_1/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_1/truediv"
  op: "RealDiv"
  input: "clip_by_norm_1/mul_1"
  input: "clip_by_norm_1/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_1"
  op: "Identity"
  input: "clip_by_norm_1/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_2/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-0/BiasAdd_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-0/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_2/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_2/Sum"
  op: "Sum"
  input: "clip_by_norm_2/mul"
  input: "clip_by_norm_2/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_2/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_2/Greater"
  op: "Greater"
  input: "clip_by_norm_2/Sum"
  input: "clip_by_norm_2/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_2/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "clip_by_norm_2/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_2/ones_like"
  op: "Fill"
  input: "clip_by_norm_2/ones_like/Shape"
  input: "clip_by_norm_2/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_2/Select"
  op: "Select"
  input: "clip_by_norm_2/Greater"
  input: "clip_by_norm_2/Sum"
  input: "clip_by_norm_2/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_2/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_2/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_2/Select_1"
  op: "Select"
  input: "clip_by_norm_2/Greater"
  input: "clip_by_norm_2/Sqrt"
  input: "clip_by_norm_2/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_2/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_2/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-0/BiasAdd_grad/tuple/control_dependency_1"
  input: "clip_by_norm_2/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_2/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_2/Maximum"
  op: "Maximum"
  input: "clip_by_norm_2/Select_1"
  input: "clip_by_norm_2/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_2/truediv"
  op: "RealDiv"
  input: "clip_by_norm_2/mul_1"
  input: "clip_by_norm_2/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_2"
  op: "Identity"
  input: "clip_by_norm_2/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_3/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-1/conv_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-1/conv_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_3/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_3/Sum"
  op: "Sum"
  input: "clip_by_norm_3/mul"
  input: "clip_by_norm_3/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_3/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_3/Greater"
  op: "Greater"
  input: "clip_by_norm_3/Sum"
  input: "clip_by_norm_3/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_3/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_3/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_3/ones_like"
  op: "Fill"
  input: "clip_by_norm_3/ones_like/Shape"
  input: "clip_by_norm_3/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_3/Select"
  op: "Select"
  input: "clip_by_norm_3/Greater"
  input: "clip_by_norm_3/Sum"
  input: "clip_by_norm_3/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_3/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_3/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_3/Select_1"
  op: "Select"
  input: "clip_by_norm_3/Greater"
  input: "clip_by_norm_3/Sqrt"
  input: "clip_by_norm_3/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_3/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_3/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-1/conv_grad/tuple/control_dependency_1"
  input: "clip_by_norm_3/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_3/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_3/Maximum"
  op: "Maximum"
  input: "clip_by_norm_3/Select_1"
  input: "clip_by_norm_3/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_3/truediv"
  op: "RealDiv"
  input: "clip_by_norm_3/mul_1"
  input: "clip_by_norm_3/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_3"
  op: "Identity"
  input: "clip_by_norm_3/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_4/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-1/BiasAdd_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-1/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_4/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_4/Sum"
  op: "Sum"
  input: "clip_by_norm_4/mul"
  input: "clip_by_norm_4/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_4/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_4/Greater"
  op: "Greater"
  input: "clip_by_norm_4/Sum"
  input: "clip_by_norm_4/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_4/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "clip_by_norm_4/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_4/ones_like"
  op: "Fill"
  input: "clip_by_norm_4/ones_like/Shape"
  input: "clip_by_norm_4/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_4/Select"
  op: "Select"
  input: "clip_by_norm_4/Greater"
  input: "clip_by_norm_4/Sum"
  input: "clip_by_norm_4/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_4/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_4/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_4/Select_1"
  op: "Select"
  input: "clip_by_norm_4/Greater"
  input: "clip_by_norm_4/Sqrt"
  input: "clip_by_norm_4/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_4/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_4/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-1/BiasAdd_grad/tuple/control_dependency_1"
  input: "clip_by_norm_4/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_4/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_4/Maximum"
  op: "Maximum"
  input: "clip_by_norm_4/Select_1"
  input: "clip_by_norm_4/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_4/truediv"
  op: "RealDiv"
  input: "clip_by_norm_4/mul_1"
  input: "clip_by_norm_4/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_4"
  op: "Identity"
  input: "clip_by_norm_4/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_5/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-2/conv_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-2/conv_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_5/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_5/Sum"
  op: "Sum"
  input: "clip_by_norm_5/mul"
  input: "clip_by_norm_5/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_5/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_5/Greater"
  op: "Greater"
  input: "clip_by_norm_5/Sum"
  input: "clip_by_norm_5/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_5/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_5/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_5/ones_like"
  op: "Fill"
  input: "clip_by_norm_5/ones_like/Shape"
  input: "clip_by_norm_5/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_5/Select"
  op: "Select"
  input: "clip_by_norm_5/Greater"
  input: "clip_by_norm_5/Sum"
  input: "clip_by_norm_5/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_5/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_5/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_5/Select_1"
  op: "Select"
  input: "clip_by_norm_5/Greater"
  input: "clip_by_norm_5/Sqrt"
  input: "clip_by_norm_5/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_5/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_5/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-2/conv_grad/tuple/control_dependency_1"
  input: "clip_by_norm_5/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_5/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_5/Maximum"
  op: "Maximum"
  input: "clip_by_norm_5/Select_1"
  input: "clip_by_norm_5/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_5/truediv"
  op: "RealDiv"
  input: "clip_by_norm_5/mul_1"
  input: "clip_by_norm_5/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_5"
  op: "Identity"
  input: "clip_by_norm_5/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_6/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-2/BiasAdd_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-2/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_6/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_6/Sum"
  op: "Sum"
  input: "clip_by_norm_6/mul"
  input: "clip_by_norm_6/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_6/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_6/Greater"
  op: "Greater"
  input: "clip_by_norm_6/Sum"
  input: "clip_by_norm_6/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_6/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "clip_by_norm_6/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_6/ones_like"
  op: "Fill"
  input: "clip_by_norm_6/ones_like/Shape"
  input: "clip_by_norm_6/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_6/Select"
  op: "Select"
  input: "clip_by_norm_6/Greater"
  input: "clip_by_norm_6/Sum"
  input: "clip_by_norm_6/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_6/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_6/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_6/Select_1"
  op: "Select"
  input: "clip_by_norm_6/Greater"
  input: "clip_by_norm_6/Sqrt"
  input: "clip_by_norm_6/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_6/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_6/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-2/BiasAdd_grad/tuple/control_dependency_1"
  input: "clip_by_norm_6/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_6/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_6/Maximum"
  op: "Maximum"
  input: "clip_by_norm_6/Select_1"
  input: "clip_by_norm_6/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_6/truediv"
  op: "RealDiv"
  input: "clip_by_norm_6/mul_1"
  input: "clip_by_norm_6/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_6"
  op: "Identity"
  input: "clip_by_norm_6/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_7/mul"
  op: "Mul"
  input: "gradients/embed_1/embedding_lookup_grad/Reshape"
  input: "gradients/embed_1/embedding_lookup_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_7/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_7/Sum"
  op: "Sum"
  input: "clip_by_norm_7/mul"
  input: "clip_by_norm_7/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_7/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_7/Greater"
  op: "Greater"
  input: "clip_by_norm_7/Sum"
  input: "clip_by_norm_7/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_7/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_7/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_7/ones_like"
  op: "Fill"
  input: "clip_by_norm_7/ones_like/Shape"
  input: "clip_by_norm_7/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_7/Select"
  op: "Select"
  input: "clip_by_norm_7/Greater"
  input: "clip_by_norm_7/Sum"
  input: "clip_by_norm_7/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_7/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_7/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_7/Select_1"
  op: "Select"
  input: "clip_by_norm_7/Greater"
  input: "clip_by_norm_7/Sqrt"
  input: "clip_by_norm_7/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_7/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_7/mul_1"
  op: "Mul"
  input: "gradients/embed_1/embedding_lookup_grad/Reshape"
  input: "clip_by_norm_7/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_7/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_7/Maximum"
  op: "Maximum"
  input: "clip_by_norm_7/Select_1"
  input: "clip_by_norm_7/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_7/truediv"
  op: "RealDiv"
  input: "clip_by_norm_7/mul_1"
  input: "clip_by_norm_7/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_7"
  op: "Identity"
  input: "clip_by_norm_7/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_8/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-0_1/conv_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-0_1/conv_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_8/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_8/Sum"
  op: "Sum"
  input: "clip_by_norm_8/mul"
  input: "clip_by_norm_8/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_8/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_8/Greater"
  op: "Greater"
  input: "clip_by_norm_8/Sum"
  input: "clip_by_norm_8/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_8/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_8/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_8/ones_like"
  op: "Fill"
  input: "clip_by_norm_8/ones_like/Shape"
  input: "clip_by_norm_8/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_8/Select"
  op: "Select"
  input: "clip_by_norm_8/Greater"
  input: "clip_by_norm_8/Sum"
  input: "clip_by_norm_8/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_8/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_8/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_8/Select_1"
  op: "Select"
  input: "clip_by_norm_8/Greater"
  input: "clip_by_norm_8/Sqrt"
  input: "clip_by_norm_8/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_8/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_8/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-0_1/conv_grad/tuple/control_dependency_1"
  input: "clip_by_norm_8/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_8/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_8/Maximum"
  op: "Maximum"
  input: "clip_by_norm_8/Select_1"
  input: "clip_by_norm_8/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_8/truediv"
  op: "RealDiv"
  input: "clip_by_norm_8/mul_1"
  input: "clip_by_norm_8/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_8"
  op: "Identity"
  input: "clip_by_norm_8/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_9/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-0_1/BiasAdd_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-0_1/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_9/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_9/Sum"
  op: "Sum"
  input: "clip_by_norm_9/mul"
  input: "clip_by_norm_9/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_9/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_9/Greater"
  op: "Greater"
  input: "clip_by_norm_9/Sum"
  input: "clip_by_norm_9/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_9/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "clip_by_norm_9/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_9/ones_like"
  op: "Fill"
  input: "clip_by_norm_9/ones_like/Shape"
  input: "clip_by_norm_9/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_9/Select"
  op: "Select"
  input: "clip_by_norm_9/Greater"
  input: "clip_by_norm_9/Sum"
  input: "clip_by_norm_9/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_9/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_9/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_9/Select_1"
  op: "Select"
  input: "clip_by_norm_9/Greater"
  input: "clip_by_norm_9/Sqrt"
  input: "clip_by_norm_9/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_9/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_9/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-0_1/BiasAdd_grad/tuple/control_dependency_1"
  input: "clip_by_norm_9/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_9/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_9/Maximum"
  op: "Maximum"
  input: "clip_by_norm_9/Select_1"
  input: "clip_by_norm_9/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_9/truediv"
  op: "RealDiv"
  input: "clip_by_norm_9/mul_1"
  input: "clip_by_norm_9/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_9"
  op: "Identity"
  input: "clip_by_norm_9/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_10/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-1_1/conv_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-1_1/conv_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_10/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_10/Sum"
  op: "Sum"
  input: "clip_by_norm_10/mul"
  input: "clip_by_norm_10/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_10/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_10/Greater"
  op: "Greater"
  input: "clip_by_norm_10/Sum"
  input: "clip_by_norm_10/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_10/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_10/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_10/ones_like"
  op: "Fill"
  input: "clip_by_norm_10/ones_like/Shape"
  input: "clip_by_norm_10/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_10/Select"
  op: "Select"
  input: "clip_by_norm_10/Greater"
  input: "clip_by_norm_10/Sum"
  input: "clip_by_norm_10/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_10/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_10/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_10/Select_1"
  op: "Select"
  input: "clip_by_norm_10/Greater"
  input: "clip_by_norm_10/Sqrt"
  input: "clip_by_norm_10/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_10/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_10/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-1_1/conv_grad/tuple/control_dependency_1"
  input: "clip_by_norm_10/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_10/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_10/Maximum"
  op: "Maximum"
  input: "clip_by_norm_10/Select_1"
  input: "clip_by_norm_10/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_10/truediv"
  op: "RealDiv"
  input: "clip_by_norm_10/mul_1"
  input: "clip_by_norm_10/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_10"
  op: "Identity"
  input: "clip_by_norm_10/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_11/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-1_1/BiasAdd_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-1_1/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_11/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_11/Sum"
  op: "Sum"
  input: "clip_by_norm_11/mul"
  input: "clip_by_norm_11/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_11/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_11/Greater"
  op: "Greater"
  input: "clip_by_norm_11/Sum"
  input: "clip_by_norm_11/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_11/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "clip_by_norm_11/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_11/ones_like"
  op: "Fill"
  input: "clip_by_norm_11/ones_like/Shape"
  input: "clip_by_norm_11/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_11/Select"
  op: "Select"
  input: "clip_by_norm_11/Greater"
  input: "clip_by_norm_11/Sum"
  input: "clip_by_norm_11/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_11/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_11/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_11/Select_1"
  op: "Select"
  input: "clip_by_norm_11/Greater"
  input: "clip_by_norm_11/Sqrt"
  input: "clip_by_norm_11/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_11/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_11/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-1_1/BiasAdd_grad/tuple/control_dependency_1"
  input: "clip_by_norm_11/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_11/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_11/Maximum"
  op: "Maximum"
  input: "clip_by_norm_11/Select_1"
  input: "clip_by_norm_11/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_11/truediv"
  op: "RealDiv"
  input: "clip_by_norm_11/mul_1"
  input: "clip_by_norm_11/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_11"
  op: "Identity"
  input: "clip_by_norm_11/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_12/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-2_1/conv_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-2_1/conv_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_12/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_12/Sum"
  op: "Sum"
  input: "clip_by_norm_12/mul"
  input: "clip_by_norm_12/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_12/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_12/Greater"
  op: "Greater"
  input: "clip_by_norm_12/Sum"
  input: "clip_by_norm_12/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_12/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_12/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_12/ones_like"
  op: "Fill"
  input: "clip_by_norm_12/ones_like/Shape"
  input: "clip_by_norm_12/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_12/Select"
  op: "Select"
  input: "clip_by_norm_12/Greater"
  input: "clip_by_norm_12/Sum"
  input: "clip_by_norm_12/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_12/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_12/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_12/Select_1"
  op: "Select"
  input: "clip_by_norm_12/Greater"
  input: "clip_by_norm_12/Sqrt"
  input: "clip_by_norm_12/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_12/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_12/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-2_1/conv_grad/tuple/control_dependency_1"
  input: "clip_by_norm_12/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_12/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_12/Maximum"
  op: "Maximum"
  input: "clip_by_norm_12/Select_1"
  input: "clip_by_norm_12/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_12/truediv"
  op: "RealDiv"
  input: "clip_by_norm_12/mul_1"
  input: "clip_by_norm_12/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_12"
  op: "Identity"
  input: "clip_by_norm_12/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_13/mul"
  op: "Mul"
  input: "gradients/conv-maxpool-2_1/BiasAdd_grad/tuple/control_dependency_1"
  input: "gradients/conv-maxpool-2_1/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_13/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_13/Sum"
  op: "Sum"
  input: "clip_by_norm_13/mul"
  input: "clip_by_norm_13/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_13/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_13/Greater"
  op: "Greater"
  input: "clip_by_norm_13/Sum"
  input: "clip_by_norm_13/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_13/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "clip_by_norm_13/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_13/ones_like"
  op: "Fill"
  input: "clip_by_norm_13/ones_like/Shape"
  input: "clip_by_norm_13/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_13/Select"
  op: "Select"
  input: "clip_by_norm_13/Greater"
  input: "clip_by_norm_13/Sum"
  input: "clip_by_norm_13/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_13/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_13/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_13/Select_1"
  op: "Select"
  input: "clip_by_norm_13/Greater"
  input: "clip_by_norm_13/Sqrt"
  input: "clip_by_norm_13/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_13/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_13/mul_1"
  op: "Mul"
  input: "gradients/conv-maxpool-2_1/BiasAdd_grad/tuple/control_dependency_1"
  input: "clip_by_norm_13/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_13/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_13/Maximum"
  op: "Maximum"
  input: "clip_by_norm_13/Select_1"
  input: "clip_by_norm_13/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_13/truediv"
  op: "RealDiv"
  input: "clip_by_norm_13/mul_1"
  input: "clip_by_norm_13/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_13"
  op: "Identity"
  input: "clip_by_norm_13/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_14/mul"
  op: "Mul"
  input: "gradients/AddN"
  input: "gradients/AddN"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_14/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_14/Sum"
  op: "Sum"
  input: "clip_by_norm_14/mul"
  input: "clip_by_norm_14/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_14/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_14/Greater"
  op: "Greater"
  input: "clip_by_norm_14/Sum"
  input: "clip_by_norm_14/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_14/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_14/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_14/ones_like"
  op: "Fill"
  input: "clip_by_norm_14/ones_like/Shape"
  input: "clip_by_norm_14/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_14/Select"
  op: "Select"
  input: "clip_by_norm_14/Greater"
  input: "clip_by_norm_14/Sum"
  input: "clip_by_norm_14/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_14/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_14/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_14/Select_1"
  op: "Select"
  input: "clip_by_norm_14/Greater"
  input: "clip_by_norm_14/Sqrt"
  input: "clip_by_norm_14/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_14/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_14/mul_1"
  op: "Mul"
  input: "gradients/AddN"
  input: "clip_by_norm_14/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_14/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_14/Maximum"
  op: "Maximum"
  input: "clip_by_norm_14/Select_1"
  input: "clip_by_norm_14/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_14/truediv"
  op: "RealDiv"
  input: "clip_by_norm_14/mul_1"
  input: "clip_by_norm_14/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_14"
  op: "Identity"
  input: "clip_by_norm_14/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_15/mul"
  op: "Mul"
  input: "gradients/MatMul_2_grad/tuple/control_dependency_1"
  input: "gradients/MatMul_2_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_15/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_15/Sum"
  op: "Sum"
  input: "clip_by_norm_15/mul"
  input: "clip_by_norm_15/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_15/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_15/Greater"
  op: "Greater"
  input: "clip_by_norm_15/Sum"
  input: "clip_by_norm_15/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_15/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_15/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_15/ones_like"
  op: "Fill"
  input: "clip_by_norm_15/ones_like/Shape"
  input: "clip_by_norm_15/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_15/Select"
  op: "Select"
  input: "clip_by_norm_15/Greater"
  input: "clip_by_norm_15/Sum"
  input: "clip_by_norm_15/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_15/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_15/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_15/Select_1"
  op: "Select"
  input: "clip_by_norm_15/Greater"
  input: "clip_by_norm_15/Sqrt"
  input: "clip_by_norm_15/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_15/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_15/mul_1"
  op: "Mul"
  input: "gradients/MatMul_2_grad/tuple/control_dependency_1"
  input: "clip_by_norm_15/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_15/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_15/Maximum"
  op: "Maximum"
  input: "clip_by_norm_15/Select_1"
  input: "clip_by_norm_15/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_15/truediv"
  op: "RealDiv"
  input: "clip_by_norm_15/mul_1"
  input: "clip_by_norm_15/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_15"
  op: "Identity"
  input: "clip_by_norm_15/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_16/mul"
  op: "Mul"
  input: "gradients/AddN_7"
  input: "gradients/AddN_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_16/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_16/Sum"
  op: "Sum"
  input: "clip_by_norm_16/mul"
  input: "clip_by_norm_16/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_16/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_16/Greater"
  op: "Greater"
  input: "clip_by_norm_16/Sum"
  input: "clip_by_norm_16/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_16/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "clip_by_norm_16/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_16/ones_like"
  op: "Fill"
  input: "clip_by_norm_16/ones_like/Shape"
  input: "clip_by_norm_16/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_16/Select"
  op: "Select"
  input: "clip_by_norm_16/Greater"
  input: "clip_by_norm_16/Sum"
  input: "clip_by_norm_16/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_16/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_16/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_16/Select_1"
  op: "Select"
  input: "clip_by_norm_16/Greater"
  input: "clip_by_norm_16/Sqrt"
  input: "clip_by_norm_16/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_16/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_16/mul_1"
  op: "Mul"
  input: "gradients/AddN_7"
  input: "clip_by_norm_16/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_16/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_16/Maximum"
  op: "Maximum"
  input: "clip_by_norm_16/Select_1"
  input: "clip_by_norm_16/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_16/truediv"
  op: "RealDiv"
  input: "clip_by_norm_16/mul_1"
  input: "clip_by_norm_16/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_16"
  op: "Identity"
  input: "clip_by_norm_16/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_17/mul"
  op: "Mul"
  input: "gradients/AddN_5"
  input: "gradients/AddN_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_17/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_17/Sum"
  op: "Sum"
  input: "clip_by_norm_17/mul"
  input: "clip_by_norm_17/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_17/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_17/Greater"
  op: "Greater"
  input: "clip_by_norm_17/Sum"
  input: "clip_by_norm_17/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_17/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_17/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_17/ones_like"
  op: "Fill"
  input: "clip_by_norm_17/ones_like/Shape"
  input: "clip_by_norm_17/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_17/Select"
  op: "Select"
  input: "clip_by_norm_17/Greater"
  input: "clip_by_norm_17/Sum"
  input: "clip_by_norm_17/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_17/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_17/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_17/Select_1"
  op: "Select"
  input: "clip_by_norm_17/Greater"
  input: "clip_by_norm_17/Sqrt"
  input: "clip_by_norm_17/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_17/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_17/mul_1"
  op: "Mul"
  input: "gradients/AddN_5"
  input: "clip_by_norm_17/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_17/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_17/Maximum"
  op: "Maximum"
  input: "clip_by_norm_17/Select_1"
  input: "clip_by_norm_17/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_17/truediv"
  op: "RealDiv"
  input: "clip_by_norm_17/mul_1"
  input: "clip_by_norm_17/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_17"
  op: "Identity"
  input: "clip_by_norm_17/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_18/mul"
  op: "Mul"
  input: "gradients/MatMul_8_grad/tuple/control_dependency_1"
  input: "gradients/MatMul_8_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_18/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_18/Sum"
  op: "Sum"
  input: "clip_by_norm_18/mul"
  input: "clip_by_norm_18/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_18/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_18/Greater"
  op: "Greater"
  input: "clip_by_norm_18/Sum"
  input: "clip_by_norm_18/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_18/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_18/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_18/ones_like"
  op: "Fill"
  input: "clip_by_norm_18/ones_like/Shape"
  input: "clip_by_norm_18/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_18/Select"
  op: "Select"
  input: "clip_by_norm_18/Greater"
  input: "clip_by_norm_18/Sum"
  input: "clip_by_norm_18/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_18/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_18/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_18/Select_1"
  op: "Select"
  input: "clip_by_norm_18/Greater"
  input: "clip_by_norm_18/Sqrt"
  input: "clip_by_norm_18/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_18/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_18/mul_1"
  op: "Mul"
  input: "gradients/MatMul_8_grad/tuple/control_dependency_1"
  input: "clip_by_norm_18/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_18/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_18/Maximum"
  op: "Maximum"
  input: "clip_by_norm_18/Select_1"
  input: "clip_by_norm_18/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_18/truediv"
  op: "RealDiv"
  input: "clip_by_norm_18/mul_1"
  input: "clip_by_norm_18/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_18"
  op: "Identity"
  input: "clip_by_norm_18/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_19/mul"
  op: "Mul"
  input: "gradients/add_4_grad/tuple/control_dependency_1"
  input: "gradients/add_4_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_19/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_19/Sum"
  op: "Sum"
  input: "clip_by_norm_19/mul"
  input: "clip_by_norm_19/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_19/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_19/Greater"
  op: "Greater"
  input: "clip_by_norm_19/Sum"
  input: "clip_by_norm_19/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_19/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "clip_by_norm_19/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_19/ones_like"
  op: "Fill"
  input: "clip_by_norm_19/ones_like/Shape"
  input: "clip_by_norm_19/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_19/Select"
  op: "Select"
  input: "clip_by_norm_19/Greater"
  input: "clip_by_norm_19/Sum"
  input: "clip_by_norm_19/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_19/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_19/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_19/Select_1"
  op: "Select"
  input: "clip_by_norm_19/Greater"
  input: "clip_by_norm_19/Sqrt"
  input: "clip_by_norm_19/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_19/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_19/mul_1"
  op: "Mul"
  input: "gradients/add_4_grad/tuple/control_dependency_1"
  input: "clip_by_norm_19/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_19/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_19/Maximum"
  op: "Maximum"
  input: "clip_by_norm_19/Select_1"
  input: "clip_by_norm_19/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_19/truediv"
  op: "RealDiv"
  input: "clip_by_norm_19/mul_1"
  input: "clip_by_norm_19/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_19"
  op: "Identity"
  input: "clip_by_norm_19/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_20/mul"
  op: "Mul"
  input: "gradients/MatMul_3_grad/tuple/control_dependency_1"
  input: "gradients/MatMul_3_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_20/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_20/Sum"
  op: "Sum"
  input: "clip_by_norm_20/mul"
  input: "clip_by_norm_20/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_20/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_20/Greater"
  op: "Greater"
  input: "clip_by_norm_20/Sum"
  input: "clip_by_norm_20/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_20/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_20/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_20/ones_like"
  op: "Fill"
  input: "clip_by_norm_20/ones_like/Shape"
  input: "clip_by_norm_20/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_20/Select"
  op: "Select"
  input: "clip_by_norm_20/Greater"
  input: "clip_by_norm_20/Sum"
  input: "clip_by_norm_20/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_20/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_20/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_20/Select_1"
  op: "Select"
  input: "clip_by_norm_20/Greater"
  input: "clip_by_norm_20/Sqrt"
  input: "clip_by_norm_20/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_20/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_20/mul_1"
  op: "Mul"
  input: "gradients/MatMul_3_grad/tuple/control_dependency_1"
  input: "clip_by_norm_20/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_20/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_20/Maximum"
  op: "Maximum"
  input: "clip_by_norm_20/Select_1"
  input: "clip_by_norm_20/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_20/truediv"
  op: "RealDiv"
  input: "clip_by_norm_20/mul_1"
  input: "clip_by_norm_20/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_20"
  op: "Identity"
  input: "clip_by_norm_20/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_21/mul"
  op: "Mul"
  input: "gradients/MatMul_4_grad/tuple/control_dependency_1"
  input: "gradients/MatMul_4_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_21/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_21/Sum"
  op: "Sum"
  input: "clip_by_norm_21/mul"
  input: "clip_by_norm_21/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_21/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_21/Greater"
  op: "Greater"
  input: "clip_by_norm_21/Sum"
  input: "clip_by_norm_21/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_21/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_21/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_21/ones_like"
  op: "Fill"
  input: "clip_by_norm_21/ones_like/Shape"
  input: "clip_by_norm_21/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_21/Select"
  op: "Select"
  input: "clip_by_norm_21/Greater"
  input: "clip_by_norm_21/Sum"
  input: "clip_by_norm_21/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_21/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_21/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_21/Select_1"
  op: "Select"
  input: "clip_by_norm_21/Greater"
  input: "clip_by_norm_21/Sqrt"
  input: "clip_by_norm_21/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_21/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_21/mul_1"
  op: "Mul"
  input: "gradients/MatMul_4_grad/tuple/control_dependency_1"
  input: "clip_by_norm_21/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_21/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_21/Maximum"
  op: "Maximum"
  input: "clip_by_norm_21/Select_1"
  input: "clip_by_norm_21/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_21/truediv"
  op: "RealDiv"
  input: "clip_by_norm_21/mul_1"
  input: "clip_by_norm_21/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_21"
  op: "Identity"
  input: "clip_by_norm_21/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_22/mul"
  op: "Mul"
  input: "gradients/AddN_8"
  input: "gradients/AddN_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_22/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_22/Sum"
  op: "Sum"
  input: "clip_by_norm_22/mul"
  input: "clip_by_norm_22/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_22/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_22/Greater"
  op: "Greater"
  input: "clip_by_norm_22/Sum"
  input: "clip_by_norm_22/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_22/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "clip_by_norm_22/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_22/ones_like"
  op: "Fill"
  input: "clip_by_norm_22/ones_like/Shape"
  input: "clip_by_norm_22/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_22/Select"
  op: "Select"
  input: "clip_by_norm_22/Greater"
  input: "clip_by_norm_22/Sum"
  input: "clip_by_norm_22/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_22/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_22/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_22/Select_1"
  op: "Select"
  input: "clip_by_norm_22/Greater"
  input: "clip_by_norm_22/Sqrt"
  input: "clip_by_norm_22/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_22/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_22/mul_1"
  op: "Mul"
  input: "gradients/AddN_8"
  input: "clip_by_norm_22/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_22/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_22/Maximum"
  op: "Maximum"
  input: "clip_by_norm_22/Select_1"
  input: "clip_by_norm_22/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_22/truediv"
  op: "RealDiv"
  input: "clip_by_norm_22/mul_1"
  input: "clip_by_norm_22/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_22"
  op: "Identity"
  input: "clip_by_norm_22/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_23/mul"
  op: "Mul"
  input: "gradients/AddN_6"
  input: "gradients/AddN_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_23/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_23/Sum"
  op: "Sum"
  input: "clip_by_norm_23/mul"
  input: "clip_by_norm_23/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_23/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_23/Greater"
  op: "Greater"
  input: "clip_by_norm_23/Sum"
  input: "clip_by_norm_23/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_23/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_23/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_23/ones_like"
  op: "Fill"
  input: "clip_by_norm_23/ones_like/Shape"
  input: "clip_by_norm_23/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_23/Select"
  op: "Select"
  input: "clip_by_norm_23/Greater"
  input: "clip_by_norm_23/Sum"
  input: "clip_by_norm_23/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_23/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_23/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_23/Select_1"
  op: "Select"
  input: "clip_by_norm_23/Greater"
  input: "clip_by_norm_23/Sqrt"
  input: "clip_by_norm_23/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_23/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_23/mul_1"
  op: "Mul"
  input: "gradients/AddN_6"
  input: "clip_by_norm_23/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_23/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_23/Maximum"
  op: "Maximum"
  input: "clip_by_norm_23/Select_1"
  input: "clip_by_norm_23/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_23/truediv"
  op: "RealDiv"
  input: "clip_by_norm_23/mul_1"
  input: "clip_by_norm_23/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_23"
  op: "Identity"
  input: "clip_by_norm_23/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_24/mul"
  op: "Mul"
  input: "gradients/MatMul_11_grad/tuple/control_dependency_1"
  input: "gradients/MatMul_11_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_24/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_24/Sum"
  op: "Sum"
  input: "clip_by_norm_24/mul"
  input: "clip_by_norm_24/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_24/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_24/Greater"
  op: "Greater"
  input: "clip_by_norm_24/Sum"
  input: "clip_by_norm_24/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_24/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_24/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_24/ones_like"
  op: "Fill"
  input: "clip_by_norm_24/ones_like/Shape"
  input: "clip_by_norm_24/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_24/Select"
  op: "Select"
  input: "clip_by_norm_24/Greater"
  input: "clip_by_norm_24/Sum"
  input: "clip_by_norm_24/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_24/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_24/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_24/Select_1"
  op: "Select"
  input: "clip_by_norm_24/Greater"
  input: "clip_by_norm_24/Sqrt"
  input: "clip_by_norm_24/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_24/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_24/mul_1"
  op: "Mul"
  input: "gradients/MatMul_11_grad/tuple/control_dependency_1"
  input: "clip_by_norm_24/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_24/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_24/Maximum"
  op: "Maximum"
  input: "clip_by_norm_24/Select_1"
  input: "clip_by_norm_24/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_24/truediv"
  op: "RealDiv"
  input: "clip_by_norm_24/mul_1"
  input: "clip_by_norm_24/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_24"
  op: "Identity"
  input: "clip_by_norm_24/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_25/mul"
  op: "Mul"
  input: "gradients/add_9_grad/tuple/control_dependency_1"
  input: "gradients/add_9_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_25/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_25/Sum"
  op: "Sum"
  input: "clip_by_norm_25/mul"
  input: "clip_by_norm_25/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_25/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_25/Greater"
  op: "Greater"
  input: "clip_by_norm_25/Sum"
  input: "clip_by_norm_25/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_25/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "clip_by_norm_25/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_25/ones_like"
  op: "Fill"
  input: "clip_by_norm_25/ones_like/Shape"
  input: "clip_by_norm_25/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_25/Select"
  op: "Select"
  input: "clip_by_norm_25/Greater"
  input: "clip_by_norm_25/Sum"
  input: "clip_by_norm_25/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_25/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_25/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_25/Select_1"
  op: "Select"
  input: "clip_by_norm_25/Greater"
  input: "clip_by_norm_25/Sqrt"
  input: "clip_by_norm_25/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_25/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_25/mul_1"
  op: "Mul"
  input: "gradients/add_9_grad/tuple/control_dependency_1"
  input: "clip_by_norm_25/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_25/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_25/Maximum"
  op: "Maximum"
  input: "clip_by_norm_25/Select_1"
  input: "clip_by_norm_25/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_25/truediv"
  op: "RealDiv"
  input: "clip_by_norm_25/mul_1"
  input: "clip_by_norm_25/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_25"
  op: "Identity"
  input: "clip_by_norm_25/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_26/mul"
  op: "Mul"
  input: "gradients/MatMul_5_grad/tuple/control_dependency_1"
  input: "gradients/MatMul_5_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_26/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_26/Sum"
  op: "Sum"
  input: "clip_by_norm_26/mul"
  input: "clip_by_norm_26/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_26/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_26/Greater"
  op: "Greater"
  input: "clip_by_norm_26/Sum"
  input: "clip_by_norm_26/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_26/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_26/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_26/ones_like"
  op: "Fill"
  input: "clip_by_norm_26/ones_like/Shape"
  input: "clip_by_norm_26/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_26/Select"
  op: "Select"
  input: "clip_by_norm_26/Greater"
  input: "clip_by_norm_26/Sum"
  input: "clip_by_norm_26/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_26/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_26/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_26/Select_1"
  op: "Select"
  input: "clip_by_norm_26/Greater"
  input: "clip_by_norm_26/Sqrt"
  input: "clip_by_norm_26/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_26/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_26/mul_1"
  op: "Mul"
  input: "gradients/MatMul_5_grad/tuple/control_dependency_1"
  input: "clip_by_norm_26/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_26/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_26/Maximum"
  op: "Maximum"
  input: "clip_by_norm_26/Select_1"
  input: "clip_by_norm_26/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_26/truediv"
  op: "RealDiv"
  input: "clip_by_norm_26/mul_1"
  input: "clip_by_norm_26/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_26"
  op: "Identity"
  input: "clip_by_norm_26/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_27/mul"
  op: "Mul"
  input: "gradients/MatMul_grad/tuple/control_dependency_1"
  input: "gradients/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_27/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_27/Sum"
  op: "Sum"
  input: "clip_by_norm_27/mul"
  input: "clip_by_norm_27/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_27/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_27/Greater"
  op: "Greater"
  input: "clip_by_norm_27/Sum"
  input: "clip_by_norm_27/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_27/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_27/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_27/ones_like"
  op: "Fill"
  input: "clip_by_norm_27/ones_like/Shape"
  input: "clip_by_norm_27/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_27/Select"
  op: "Select"
  input: "clip_by_norm_27/Greater"
  input: "clip_by_norm_27/Sum"
  input: "clip_by_norm_27/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_27/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_27/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_27/Select_1"
  op: "Select"
  input: "clip_by_norm_27/Greater"
  input: "clip_by_norm_27/Sqrt"
  input: "clip_by_norm_27/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_27/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_27/mul_1"
  op: "Mul"
  input: "gradients/MatMul_grad/tuple/control_dependency_1"
  input: "clip_by_norm_27/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_27/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_27/Maximum"
  op: "Maximum"
  input: "clip_by_norm_27/Select_1"
  input: "clip_by_norm_27/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_27/truediv"
  op: "RealDiv"
  input: "clip_by_norm_27/mul_1"
  input: "clip_by_norm_27/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_27"
  op: "Identity"
  input: "clip_by_norm_27/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_28/mul"
  op: "Mul"
  input: "gradients/MatMul_1_grad/tuple/control_dependency_1"
  input: "gradients/MatMul_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_28/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_28/Sum"
  op: "Sum"
  input: "clip_by_norm_28/mul"
  input: "clip_by_norm_28/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_28/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_28/Greater"
  op: "Greater"
  input: "clip_by_norm_28/Sum"
  input: "clip_by_norm_28/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_28/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "clip_by_norm_28/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_28/ones_like"
  op: "Fill"
  input: "clip_by_norm_28/ones_like/Shape"
  input: "clip_by_norm_28/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_28/Select"
  op: "Select"
  input: "clip_by_norm_28/Greater"
  input: "clip_by_norm_28/Sum"
  input: "clip_by_norm_28/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_28/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_28/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_28/Select_1"
  op: "Select"
  input: "clip_by_norm_28/Greater"
  input: "clip_by_norm_28/Sqrt"
  input: "clip_by_norm_28/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_28/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_28/mul_1"
  op: "Mul"
  input: "gradients/MatMul_1_grad/tuple/control_dependency_1"
  input: "clip_by_norm_28/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_28/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_28/Maximum"
  op: "Maximum"
  input: "clip_by_norm_28/Select_1"
  input: "clip_by_norm_28/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_28/truediv"
  op: "RealDiv"
  input: "clip_by_norm_28/mul_1"
  input: "clip_by_norm_28/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_28"
  op: "Identity"
  input: "clip_by_norm_28/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_29/mul"
  op: "Mul"
  input: "gradients/xw_plus_b_grad/tuple/control_dependency_1"
  input: "gradients/xw_plus_b_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_29/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "clip_by_norm_29/Sum"
  op: "Sum"
  input: "clip_by_norm_29/mul"
  input: "clip_by_norm_29/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "clip_by_norm_29/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "clip_by_norm_29/Greater"
  op: "Greater"
  input: "clip_by_norm_29/Sum"
  input: "clip_by_norm_29/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_29/ones_like/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "clip_by_norm_29/ones_like/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "clip_by_norm_29/ones_like"
  op: "Fill"
  input: "clip_by_norm_29/ones_like/Shape"
  input: "clip_by_norm_29/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "clip_by_norm_29/Select"
  op: "Select"
  input: "clip_by_norm_29/Greater"
  input: "clip_by_norm_29/Sum"
  input: "clip_by_norm_29/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_29/Sqrt"
  op: "Sqrt"
  input: "clip_by_norm_29/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_29/Select_1"
  op: "Select"
  input: "clip_by_norm_29/Greater"
  input: "clip_by_norm_29/Sqrt"
  input: "clip_by_norm_29/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_29/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_29/mul_1"
  op: "Mul"
  input: "gradients/xw_plus_b_grad/tuple/control_dependency_1"
  input: "clip_by_norm_29/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_29/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.0
      }
    }
  }
}
node {
  name: "clip_by_norm_29/Maximum"
  op: "Maximum"
  input: "clip_by_norm_29/Select_1"
  input: "clip_by_norm_29/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_29/truediv"
  op: "RealDiv"
  input: "clip_by_norm_29/mul_1"
  input: "clip_by_norm_29/Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "clip_by_norm_29"
  op: "Identity"
  input: "clip_by_norm_29/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "pJ\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "embed/en_embedding/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "embed/en_embedding/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19056
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta/Assign"
  op: "Assign"
  input: "embed/en_embedding/Adadelta"
  input: "embed/en_embedding/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta/read"
  op: "Identity"
  input: "embed/en_embedding/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "pJ\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "embed/en_embedding/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "embed/en_embedding/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19056
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta_1/Assign"
  op: "Assign"
  input: "embed/en_embedding/Adadelta_1"
  input: "embed/en_embedding/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "embed/en_embedding/Adadelta_1/read"
  op: "Identity"
  input: "embed/en_embedding/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-0/en_W/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-0/en_W/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-0/en_W/Adadelta"
  input: "conv-maxpool-0/en_W/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-0/en_W/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-0/en_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-0/en_W/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-0/en_W/Adadelta_1"
  input: "conv-maxpool-0/en_W/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0/en_W/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-0/en_W/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-0/en_b/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0/en_b/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0/en_b/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-0/en_b/Adadelta"
  input: "conv-maxpool-0/en_b/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0/en_b/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-0/en_b/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-0/en_b/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0/en_b/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0/en_b/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-0/en_b/Adadelta_1"
  input: "conv-maxpool-0/en_b/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0/en_b/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-0/en_b/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-1/en_W/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-1/en_W/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-1/en_W/Adadelta"
  input: "conv-maxpool-1/en_W/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-1/en_W/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-1/en_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-1/en_W/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-1/en_W/Adadelta_1"
  input: "conv-maxpool-1/en_W/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1/en_W/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-1/en_W/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-1/en_b/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1/en_b/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1/en_b/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-1/en_b/Adadelta"
  input: "conv-maxpool-1/en_b/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1/en_b/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-1/en_b/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-1/en_b/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1/en_b/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1/en_b/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-1/en_b/Adadelta_1"
  input: "conv-maxpool-1/en_b/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1/en_b/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-1/en_b/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-2/en_W/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-2/en_W/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-2/en_W/Adadelta"
  input: "conv-maxpool-2/en_W/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-2/en_W/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-2/en_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-2/en_W/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-2/en_W/Adadelta_1"
  input: "conv-maxpool-2/en_W/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2/en_W/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-2/en_W/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-2/en_b/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2/en_b/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2/en_b/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-2/en_b/Adadelta"
  input: "conv-maxpool-2/en_b/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2/en_b/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-2/en_b/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-2/en_b/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2/en_b/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2/en_b/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-2/en_b/Adadelta_1"
  input: "conv-maxpool-2/en_b/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2/en_b/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-2/en_b/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_b"
      }
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\217K\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "embed_1/mn_embedding/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "embed_1/mn_embedding/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19343
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta/Assign"
  op: "Assign"
  input: "embed_1/mn_embedding/Adadelta"
  input: "embed_1/mn_embedding/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta/read"
  op: "Identity"
  input: "embed_1/mn_embedding/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\217K\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "embed_1/mn_embedding/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "embed_1/mn_embedding/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19343
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta_1/Assign"
  op: "Assign"
  input: "embed_1/mn_embedding/Adadelta_1"
  input: "embed_1/mn_embedding/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "embed_1/mn_embedding/Adadelta_1/read"
  op: "Identity"
  input: "embed_1/mn_embedding/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-0_1/mn_W/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-0_1/mn_W/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-0_1/mn_W/Adadelta"
  input: "conv-maxpool-0_1/mn_W/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-0_1/mn_W/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-0_1/mn_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-0_1/mn_W/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-0_1/mn_W/Adadelta_1"
  input: "conv-maxpool-0_1/mn_W/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_W/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-0_1/mn_W/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_b/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_b/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_b/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-0_1/mn_b/Adadelta"
  input: "conv-maxpool-0_1/mn_b/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_b/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-0_1/mn_b/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_b/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_b/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_b/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-0_1/mn_b/Adadelta_1"
  input: "conv-maxpool-0_1/mn_b/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-0_1/mn_b/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-0_1/mn_b/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-1_1/mn_W/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-1_1/mn_W/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-1_1/mn_W/Adadelta"
  input: "conv-maxpool-1_1/mn_W/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-1_1/mn_W/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-1_1/mn_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-1_1/mn_W/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-1_1/mn_W/Adadelta_1"
  input: "conv-maxpool-1_1/mn_W/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_W/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-1_1/mn_W/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_b/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_b/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_b/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-1_1/mn_b/Adadelta"
  input: "conv-maxpool-1_1/mn_b/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_b/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-1_1/mn_b/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_b/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_b/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_b/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-1_1/mn_b/Adadelta_1"
  input: "conv-maxpool-1_1/mn_b/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-1_1/mn_b/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-1_1/mn_b/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-2_1/mn_W/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-2_1/mn_W/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-2_1/mn_W/Adadelta"
  input: "conv-maxpool-2_1/mn_W/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-2_1/mn_W/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000,\001\000\000\001\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "conv-maxpool-2_1/mn_W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "conv-maxpool-2_1/mn_W/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 300
        }
        dim {
          size: 1
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-2_1/mn_W/Adadelta_1"
  input: "conv-maxpool-2_1/mn_W/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_W/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-2_1/mn_W/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_b/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_b/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_b/Adadelta/Assign"
  op: "Assign"
  input: "conv-maxpool-2_1/mn_b/Adadelta"
  input: "conv-maxpool-2_1/mn_b/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_b/Adadelta/read"
  op: "Identity"
  input: "conv-maxpool-2_1/mn_b/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_b"
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_b/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_b/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_b/Adadelta_1/Assign"
  op: "Assign"
  input: "conv-maxpool-2_1/mn_b/Adadelta_1"
  input: "conv-maxpool-2_1/mn_b/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv-maxpool-2_1/mn_b/Adadelta_1/read"
  op: "Identity"
  input: "conv-maxpool-2_1/mn_b/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_b"
      }
    }
  }
}
node {
  name: "W/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "X\002\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "W/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "W/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "W/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "W/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "W/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 600
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "W/Adadelta/Assign"
  op: "Assign"
  input: "W/Adadelta"
  input: "W/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "W/Adadelta/read"
  op: "Identity"
  input: "W/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
}
node {
  name: "W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "X\002\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "W/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "W/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "W/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "W/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "W/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 600
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "W/Adadelta_1/Assign"
  op: "Assign"
  input: "W/Adadelta_1"
  input: "W/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "W/Adadelta_1/read"
  op: "Identity"
  input: "W/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
}
node {
  name: "Xen0/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Xen0/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Xen0/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "Xen0/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "Xen0/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Xen0/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Xen0/Adadelta/Assign"
  op: "Assign"
  input: "Xen0/Adadelta"
  input: "Xen0/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Xen0/Adadelta/read"
  op: "Identity"
  input: "Xen0/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
}
node {
  name: "Xen0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Xen0/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Xen0/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "Xen0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "Xen0/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Xen0/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Xen0/Adadelta_1/Assign"
  op: "Assign"
  input: "Xen0/Adadelta_1"
  input: "Xen0/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Xen0/Adadelta_1/read"
  op: "Identity"
  input: "Xen0/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
}
node {
  name: "Variable/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Adadelta/Assign"
  op: "Assign"
  input: "Variable/Adadelta"
  input: "Variable/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/Adadelta/read"
  op: "Identity"
  input: "Variable/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Variable/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Adadelta_1/Assign"
  op: "Assign"
  input: "Variable/Adadelta_1"
  input: "Variable/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/Adadelta_1/read"
  op: "Identity"
  input: "Variable/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "xen0_1/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "xen0_1/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "xen0_1/Adadelta/Assign"
  op: "Assign"
  input: "xen0_1/Adadelta"
  input: "xen0_1/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "xen0_1/Adadelta/read"
  op: "Identity"
  input: "xen0_1/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
}
node {
  name: "xen0_1/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "xen0_1/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "xen0_1/Adadelta_1/Assign"
  op: "Assign"
  input: "xen0_1/Adadelta_1"
  input: "xen0_1/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "xen0_1/Adadelta_1/read"
  op: "Identity"
  input: "xen0_1/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
}
node {
  name: "Ven0/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "X\002\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Ven0/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Ven0/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "Ven0/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "Ven0/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Ven0/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 600
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Ven0/Adadelta/Assign"
  op: "Assign"
  input: "Ven0/Adadelta"
  input: "Ven0/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Ven0/Adadelta/read"
  op: "Identity"
  input: "Ven0/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
}
node {
  name: "Ven0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "X\002\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Ven0/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Ven0/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "Ven0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "Ven0/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Ven0/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 600
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Ven0/Adadelta_1/Assign"
  op: "Assign"
  input: "Ven0/Adadelta_1"
  input: "Ven0/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Ven0/Adadelta_1/read"
  op: "Identity"
  input: "Ven0/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
}
node {
  name: "Variable_1/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Adadelta/Assign"
  op: "Assign"
  input: "Variable_1/Adadelta"
  input: "Variable_1/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/Adadelta/read"
  op: "Identity"
  input: "Variable_1/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "Variable_1/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Adadelta_1/Assign"
  op: "Assign"
  input: "Variable_1/Adadelta_1"
  input: "Variable_1/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/Adadelta_1/read"
  op: "Identity"
  input: "Variable_1/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "Uen0/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Uen0/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Uen0/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "Uen0/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "Uen0/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Uen0/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Uen0/Adadelta/Assign"
  op: "Assign"
  input: "Uen0/Adadelta"
  input: "Uen0/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Uen0/Adadelta/read"
  op: "Identity"
  input: "Uen0/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
}
node {
  name: "Uen0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Uen0/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Uen0/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "Uen0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "Uen0/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Uen0/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Uen0/Adadelta_1/Assign"
  op: "Assign"
  input: "Uen0/Adadelta_1"
  input: "Uen0/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Uen0/Adadelta_1/read"
  op: "Identity"
  input: "Uen0/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
}
node {
  name: "Xmn0/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Xmn0/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Xmn0/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "Xmn0/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "Xmn0/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Xmn0/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Xmn0/Adadelta/Assign"
  op: "Assign"
  input: "Xmn0/Adadelta"
  input: "Xmn0/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Xmn0/Adadelta/read"
  op: "Identity"
  input: "Xmn0/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
}
node {
  name: "Xmn0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Xmn0/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Xmn0/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "Xmn0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "Xmn0/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Xmn0/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Xmn0/Adadelta_1/Assign"
  op: "Assign"
  input: "Xmn0/Adadelta_1"
  input: "Xmn0/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Xmn0/Adadelta_1/read"
  op: "Identity"
  input: "Xmn0/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
}
node {
  name: "Variable_2/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_2/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_2/Adadelta/Assign"
  op: "Assign"
  input: "Variable_2/Adadelta"
  input: "Variable_2/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_2/Adadelta/read"
  op: "Identity"
  input: "Variable_2/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
}
node {
  name: "Variable_2/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_2/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_2/Adadelta_1/Assign"
  op: "Assign"
  input: "Variable_2/Adadelta_1"
  input: "Variable_2/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_2/Adadelta_1/read"
  op: "Identity"
  input: "Variable_2/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
}
node {
  name: "xmn0_1/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "xmn0_1/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "xmn0_1/Adadelta/Assign"
  op: "Assign"
  input: "xmn0_1/Adadelta"
  input: "xmn0_1/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "xmn0_1/Adadelta/read"
  op: "Identity"
  input: "xmn0_1/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
}
node {
  name: "xmn0_1/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "xmn0_1/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "xmn0_1/Adadelta_1/Assign"
  op: "Assign"
  input: "xmn0_1/Adadelta_1"
  input: "xmn0_1/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "xmn0_1/Adadelta_1/read"
  op: "Identity"
  input: "xmn0_1/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
}
node {
  name: "Vmn0/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "X\002\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Vmn0/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Vmn0/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "Vmn0/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "Vmn0/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Vmn0/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 600
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Vmn0/Adadelta/Assign"
  op: "Assign"
  input: "Vmn0/Adadelta"
  input: "Vmn0/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Vmn0/Adadelta/read"
  op: "Identity"
  input: "Vmn0/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
}
node {
  name: "Vmn0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "X\002\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Vmn0/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Vmn0/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "Vmn0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "Vmn0/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Vmn0/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 600
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Vmn0/Adadelta_1/Assign"
  op: "Assign"
  input: "Vmn0/Adadelta_1"
  input: "Vmn0/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Vmn0/Adadelta_1/read"
  op: "Identity"
  input: "Vmn0/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
}
node {
  name: "Variable_3/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_3/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_3/Adadelta/Assign"
  op: "Assign"
  input: "Variable_3/Adadelta"
  input: "Variable_3/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_3/Adadelta/read"
  op: "Identity"
  input: "Variable_3/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
}
node {
  name: "Variable_3/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_3/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_3/Adadelta_1/Assign"
  op: "Assign"
  input: "Variable_3/Adadelta_1"
  input: "Variable_3/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_3/Adadelta_1/read"
  op: "Identity"
  input: "Variable_3/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
}
node {
  name: "Umn0/Adadelta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Umn0/Adadelta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Umn0/Adadelta/Initializer/zeros"
  op: "Fill"
  input: "Umn0/Adadelta/Initializer/zeros/shape_as_tensor"
  input: "Umn0/Adadelta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Umn0/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Umn0/Adadelta/Assign"
  op: "Assign"
  input: "Umn0/Adadelta"
  input: "Umn0/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Umn0/Adadelta/read"
  op: "Identity"
  input: "Umn0/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
}
node {
  name: "Umn0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "Umn0/Adadelta_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Umn0/Adadelta_1/Initializer/zeros"
  op: "Fill"
  input: "Umn0/Adadelta_1/Initializer/zeros/shape_as_tensor"
  input: "Umn0/Adadelta_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Umn0/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Umn0/Adadelta_1/Assign"
  op: "Assign"
  input: "Umn0/Adadelta_1"
  input: "Umn0/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Umn0/Adadelta_1/read"
  op: "Identity"
  input: "Umn0/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
}
node {
  name: "Ten/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Ten/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Ten/Adadelta/Assign"
  op: "Assign"
  input: "Ten/Adadelta"
  input: "Ten/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Ten/Adadelta/read"
  op: "Identity"
  input: "Ten/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
}
node {
  name: "Ten/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Ten/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Ten/Adadelta_1/Assign"
  op: "Assign"
  input: "Ten/Adadelta_1"
  input: "Ten/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Ten/Adadelta_1/read"
  op: "Identity"
  input: "Ten/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
}
node {
  name: "Tmn/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Tmn/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Tmn/Adadelta/Assign"
  op: "Assign"
  input: "Tmn/Adadelta"
  input: "Tmn/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Tmn/Adadelta/read"
  op: "Identity"
  input: "Tmn/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
}
node {
  name: "Tmn/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Tmn/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Tmn/Adadelta_1/Assign"
  op: "Assign"
  input: "Tmn/Adadelta_1"
  input: "Tmn/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Tmn/Adadelta_1/read"
  op: "Identity"
  input: "Tmn/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
}
node {
  name: "Variable_4/Adadelta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_4/Adadelta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_4/Adadelta/Assign"
  op: "Assign"
  input: "Variable_4/Adadelta"
  input: "Variable_4/Adadelta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_4/Adadelta/read"
  op: "Identity"
  input: "Variable_4/Adadelta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
}
node {
  name: "Variable_4/Adadelta_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_4/Adadelta_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_4/Adadelta_1/Assign"
  op: "Assign"
  input: "Variable_4/Adadelta_1"
  input: "Variable_4/Adadelta_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_4/Adadelta_1/read"
  op: "Identity"
  input: "Variable_4/Adadelta_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
}
node {
  name: "Adadelta/lr"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Adadelta/rho"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "Adadelta/epsilon"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999974752427e-07
      }
    }
  }
}
node {
  name: "Adadelta/update_embed/en_embedding/Unique"
  op: "Unique"
  input: "gradients/embed/embedding_lookup_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "out_idx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Adadelta/update_embed/en_embedding/Shape"
  op: "Shape"
  input: "Adadelta/update_embed/en_embedding/Unique"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Adadelta/update_embed/en_embedding/strided_slice/stack"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Adadelta/update_embed/en_embedding/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Adadelta/update_embed/en_embedding/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Adadelta/update_embed/en_embedding/strided_slice"
  op: "StridedSlice"
  input: "Adadelta/update_embed/en_embedding/Shape"
  input: "Adadelta/update_embed/en_embedding/strided_slice/stack"
  input: "Adadelta/update_embed/en_embedding/strided_slice/stack_1"
  input: "Adadelta/update_embed/en_embedding/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "Adadelta/update_embed/en_embedding/UnsortedSegmentSum"
  op: "UnsortedSegmentSum"
  input: "clip_by_norm"
  input: "Adadelta/update_embed/en_embedding/Unique:1"
  input: "Adadelta/update_embed/en_embedding/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tnumsegments"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
}
node {
  name: "Adadelta/update_embed/en_embedding/SparseApplyAdadelta"
  op: "SparseApplyAdadelta"
  input: "embed/en_embedding"
  input: "embed/en_embedding/Adadelta"
  input: "embed/en_embedding/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "Adadelta/update_embed/en_embedding/UnsortedSegmentSum"
  input: "Adadelta/update_embed/en_embedding/Unique"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed/en_embedding"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-0/en_W/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-0/en_W"
  input: "conv-maxpool-0/en_W/Adadelta"
  input: "conv-maxpool-0/en_W/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-0/en_b/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-0/en_b"
  input: "conv-maxpool-0/en_b/Adadelta"
  input: "conv-maxpool-0/en_b/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-1/en_W/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-1/en_W"
  input: "conv-maxpool-1/en_W/Adadelta"
  input: "conv-maxpool-1/en_W/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-1/en_b/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-1/en_b"
  input: "conv-maxpool-1/en_b/Adadelta"
  input: "conv-maxpool-1/en_b/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-2/en_W/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-2/en_W"
  input: "conv-maxpool-2/en_W/Adadelta"
  input: "conv-maxpool-2/en_W/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-2/en_b/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-2/en_b"
  input: "conv-maxpool-2/en_b/Adadelta"
  input: "conv-maxpool-2/en_b/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2/en_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_embed_1/mn_embedding/Unique"
  op: "Unique"
  input: "gradients/embed_1/embedding_lookup_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "out_idx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Adadelta/update_embed_1/mn_embedding/Shape"
  op: "Shape"
  input: "Adadelta/update_embed_1/mn_embedding/Unique"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Adadelta/update_embed_1/mn_embedding/strided_slice/stack"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Adadelta/update_embed_1/mn_embedding/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Adadelta/update_embed_1/mn_embedding/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Adadelta/update_embed_1/mn_embedding/strided_slice"
  op: "StridedSlice"
  input: "Adadelta/update_embed_1/mn_embedding/Shape"
  input: "Adadelta/update_embed_1/mn_embedding/strided_slice/stack"
  input: "Adadelta/update_embed_1/mn_embedding/strided_slice/stack_1"
  input: "Adadelta/update_embed_1/mn_embedding/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "Adadelta/update_embed_1/mn_embedding/UnsortedSegmentSum"
  op: "UnsortedSegmentSum"
  input: "clip_by_norm_7"
  input: "Adadelta/update_embed_1/mn_embedding/Unique:1"
  input: "Adadelta/update_embed_1/mn_embedding/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tnumsegments"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
}
node {
  name: "Adadelta/update_embed_1/mn_embedding/SparseApplyAdadelta"
  op: "SparseApplyAdadelta"
  input: "embed_1/mn_embedding"
  input: "embed_1/mn_embedding/Adadelta"
  input: "embed_1/mn_embedding/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "Adadelta/update_embed_1/mn_embedding/UnsortedSegmentSum"
  input: "Adadelta/update_embed_1/mn_embedding/Unique"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@embed_1/mn_embedding"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-0_1/mn_W/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-0_1/mn_W"
  input: "conv-maxpool-0_1/mn_W/Adadelta"
  input: "conv-maxpool-0_1/mn_W/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-0_1/mn_b/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-0_1/mn_b"
  input: "conv-maxpool-0_1/mn_b/Adadelta"
  input: "conv-maxpool-0_1/mn_b/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-0_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-1_1/mn_W/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-1_1/mn_W"
  input: "conv-maxpool-1_1/mn_W/Adadelta"
  input: "conv-maxpool-1_1/mn_W/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-1_1/mn_b/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-1_1/mn_b"
  input: "conv-maxpool-1_1/mn_b/Adadelta"
  input: "conv-maxpool-1_1/mn_b/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-1_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-2_1/mn_W/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-2_1/mn_W"
  input: "conv-maxpool-2_1/mn_W/Adadelta"
  input: "conv-maxpool-2_1/mn_W/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_conv-maxpool-2_1/mn_b/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "conv-maxpool-2_1/mn_b"
  input: "conv-maxpool-2_1/mn_b/Adadelta"
  input: "conv-maxpool-2_1/mn_b/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv-maxpool-2_1/mn_b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_W/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "W"
  input: "W/Adadelta"
  input: "W/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Xen0/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Xen0"
  input: "Xen0/Adadelta"
  input: "Xen0/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xen0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Variable/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Variable"
  input: "Variable/Adadelta"
  input: "Variable/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_xen0_1/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "xen0_1"
  input: "xen0_1/Adadelta"
  input: "xen0_1/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xen0_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Ven0/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Ven0"
  input: "Ven0/Adadelta"
  input: "Ven0/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ven0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Variable_1/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Variable_1"
  input: "Variable_1/Adadelta"
  input: "Variable_1/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Uen0/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Uen0"
  input: "Uen0/Adadelta"
  input: "Uen0/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Uen0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Xmn0/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Xmn0"
  input: "Xmn0/Adadelta"
  input: "Xmn0/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Xmn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Variable_2/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Variable_2"
  input: "Variable_2/Adadelta"
  input: "Variable_2/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_xmn0_1/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "xmn0_1"
  input: "xmn0_1/Adadelta"
  input: "xmn0_1/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@xmn0_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Vmn0/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Vmn0"
  input: "Vmn0/Adadelta"
  input: "Vmn0/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Vmn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Variable_3/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Variable_3"
  input: "Variable_3/Adadelta"
  input: "Variable_3/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Umn0/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Umn0"
  input: "Umn0/Adadelta"
  input: "Umn0/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Umn0"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Ten/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Ten"
  input: "Ten/Adadelta"
  input: "Ten/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Ten"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Tmn/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Tmn"
  input: "Tmn/Adadelta"
  input: "Tmn/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Tmn"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta/update_Variable_4/ApplyAdadelta"
  op: "ApplyAdadelta"
  input: "Variable_4"
  input: "Variable_4/Adadelta"
  input: "Variable_4/Adadelta_1"
  input: "Adadelta/lr"
  input: "Adadelta/rho"
  input: "Adadelta/epsilon"
  input: "clip_by_norm_29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adadelta"
  op: "NoOp"
  input: "^Adadelta/update_Ten/ApplyAdadelta"
  input: "^Adadelta/update_Tmn/ApplyAdadelta"
  input: "^Adadelta/update_Uen0/ApplyAdadelta"
  input: "^Adadelta/update_Umn0/ApplyAdadelta"
  input: "^Adadelta/update_Variable/ApplyAdadelta"
  input: "^Adadelta/update_Variable_1/ApplyAdadelta"
  input: "^Adadelta/update_Variable_2/ApplyAdadelta"
  input: "^Adadelta/update_Variable_3/ApplyAdadelta"
  input: "^Adadelta/update_Variable_4/ApplyAdadelta"
  input: "^Adadelta/update_Ven0/ApplyAdadelta"
  input: "^Adadelta/update_Vmn0/ApplyAdadelta"
  input: "^Adadelta/update_W/ApplyAdadelta"
  input: "^Adadelta/update_Xen0/ApplyAdadelta"
  input: "^Adadelta/update_Xmn0/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-0/en_W/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-0/en_b/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-0_1/mn_W/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-0_1/mn_b/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-1/en_W/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-1/en_b/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-1_1/mn_W/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-1_1/mn_b/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-2/en_W/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-2/en_b/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-2_1/mn_W/ApplyAdadelta"
  input: "^Adadelta/update_conv-maxpool-2_1/mn_b/ApplyAdadelta"
  input: "^Adadelta/update_embed/en_embedding/SparseApplyAdadelta"
  input: "^Adadelta/update_embed_1/mn_embedding/SparseApplyAdadelta"
  input: "^Adadelta/update_xen0_1/ApplyAdadelta"
  input: "^Adadelta/update_xmn0_1/ApplyAdadelta"
}
node {
  name: "init"
  op: "NoOp"
  input: "^Ten/Adadelta/Assign"
  input: "^Ten/Adadelta_1/Assign"
  input: "^Ten/Assign"
  input: "^Tmn/Adadelta/Assign"
  input: "^Tmn/Adadelta_1/Assign"
  input: "^Tmn/Assign"
  input: "^Uen0/Adadelta/Assign"
  input: "^Uen0/Adadelta_1/Assign"
  input: "^Uen0/Assign"
  input: "^Umn0/Adadelta/Assign"
  input: "^Umn0/Adadelta_1/Assign"
  input: "^Umn0/Assign"
  input: "^Variable/Adadelta/Assign"
  input: "^Variable/Adadelta_1/Assign"
  input: "^Variable/Assign"
  input: "^Variable_1/Adadelta/Assign"
  input: "^Variable_1/Adadelta_1/Assign"
  input: "^Variable_1/Assign"
  input: "^Variable_2/Adadelta/Assign"
  input: "^Variable_2/Adadelta_1/Assign"
  input: "^Variable_2/Assign"
  input: "^Variable_3/Adadelta/Assign"
  input: "^Variable_3/Adadelta_1/Assign"
  input: "^Variable_3/Assign"
  input: "^Variable_4/Adadelta/Assign"
  input: "^Variable_4/Adadelta_1/Assign"
  input: "^Variable_4/Assign"
  input: "^Ven0/Adadelta/Assign"
  input: "^Ven0/Adadelta_1/Assign"
  input: "^Ven0/Assign"
  input: "^Vmn0/Adadelta/Assign"
  input: "^Vmn0/Adadelta_1/Assign"
  input: "^Vmn0/Assign"
  input: "^W/Adadelta/Assign"
  input: "^W/Adadelta_1/Assign"
  input: "^W/Assign"
  input: "^Xen0/Adadelta/Assign"
  input: "^Xen0/Adadelta_1/Assign"
  input: "^Xen0/Assign"
  input: "^Xmn0/Adadelta/Assign"
  input: "^Xmn0/Adadelta_1/Assign"
  input: "^Xmn0/Assign"
  input: "^conv-maxpool-0/en_W/Adadelta/Assign"
  input: "^conv-maxpool-0/en_W/Adadelta_1/Assign"
  input: "^conv-maxpool-0/en_W/Assign"
  input: "^conv-maxpool-0/en_b/Adadelta/Assign"
  input: "^conv-maxpool-0/en_b/Adadelta_1/Assign"
  input: "^conv-maxpool-0/en_b/Assign"
  input: "^conv-maxpool-0_1/mn_W/Adadelta/Assign"
  input: "^conv-maxpool-0_1/mn_W/Adadelta_1/Assign"
  input: "^conv-maxpool-0_1/mn_W/Assign"
  input: "^conv-maxpool-0_1/mn_b/Adadelta/Assign"
  input: "^conv-maxpool-0_1/mn_b/Adadelta_1/Assign"
  input: "^conv-maxpool-0_1/mn_b/Assign"
  input: "^conv-maxpool-1/en_W/Adadelta/Assign"
  input: "^conv-maxpool-1/en_W/Adadelta_1/Assign"
  input: "^conv-maxpool-1/en_W/Assign"
  input: "^conv-maxpool-1/en_b/Adadelta/Assign"
  input: "^conv-maxpool-1/en_b/Adadelta_1/Assign"
  input: "^conv-maxpool-1/en_b/Assign"
  input: "^conv-maxpool-1_1/mn_W/Adadelta/Assign"
  input: "^conv-maxpool-1_1/mn_W/Adadelta_1/Assign"
  input: "^conv-maxpool-1_1/mn_W/Assign"
  input: "^conv-maxpool-1_1/mn_b/Adadelta/Assign"
  input: "^conv-maxpool-1_1/mn_b/Adadelta_1/Assign"
  input: "^conv-maxpool-1_1/mn_b/Assign"
  input: "^conv-maxpool-2/en_W/Adadelta/Assign"
  input: "^conv-maxpool-2/en_W/Adadelta_1/Assign"
  input: "^conv-maxpool-2/en_W/Assign"
  input: "^conv-maxpool-2/en_b/Adadelta/Assign"
  input: "^conv-maxpool-2/en_b/Adadelta_1/Assign"
  input: "^conv-maxpool-2/en_b/Assign"
  input: "^conv-maxpool-2_1/mn_W/Adadelta/Assign"
  input: "^conv-maxpool-2_1/mn_W/Adadelta_1/Assign"
  input: "^conv-maxpool-2_1/mn_W/Assign"
  input: "^conv-maxpool-2_1/mn_b/Adadelta/Assign"
  input: "^conv-maxpool-2_1/mn_b/Adadelta_1/Assign"
  input: "^conv-maxpool-2_1/mn_b/Assign"
  input: "^embed/en_embedding/Adadelta/Assign"
  input: "^embed/en_embedding/Adadelta_1/Assign"
  input: "^embed/en_embedding/Assign"
  input: "^embed_1/mn_embedding/Adadelta/Assign"
  input: "^embed_1/mn_embedding/Adadelta_1/Assign"
  input: "^embed_1/mn_embedding/Assign"
  input: "^xen0_1/Adadelta/Assign"
  input: "^xen0_1/Adadelta_1/Assign"
  input: "^xen0_1/Assign"
  input: "^xmn0_1/Adadelta/Assign"
  input: "^xmn0_1/Adadelta_1/Assign"
  input: "^xmn0_1/Assign"
}
versions {
  producer: 38
}
