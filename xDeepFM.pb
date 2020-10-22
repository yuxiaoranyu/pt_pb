node {
  name: "Placeholder"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_INT8
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
  name: "train_phase"
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
        unknown_rank: true
      }
    }
  }
}
node {
  name: "Placeholder_1"
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
          size: 11
        }
      }
    }
  }
}
node {
  name: "Placeholder_2"
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
          size: 2
        }
      }
    }
  }
}
node {
  name: "Placeholder_3"
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
          size: 9
        }
      }
    }
  }
}
node {
  name: "Placeholder_4"
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
          size: 9
        }
      }
    }
  }
}
node {
  name: "single_second_embedding/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
        tensor_content: "\020\'\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "single_second_embedding/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
        float_val: -0.024475324898958206
      }
    }
  }
}
node {
  name: "single_second_embedding/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
        float_val: 0.024475324898958206
      }
    }
  }
}
node {
  name: "single_second_embedding/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "single_second_embedding/Initializer/random_uniform/shape"
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
        s: "loc:@single_second_embedding"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "single_second_embedding/Initializer/random_uniform/sub"
  op: "Sub"
  input: "single_second_embedding/Initializer/random_uniform/max"
  input: "single_second_embedding/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
      }
    }
  }
}
node {
  name: "single_second_embedding/Initializer/random_uniform/mul"
  op: "Mul"
  input: "single_second_embedding/Initializer/random_uniform/RandomUniform"
  input: "single_second_embedding/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
      }
    }
  }
}
node {
  name: "single_second_embedding/Initializer/random_uniform"
  op: "Add"
  input: "single_second_embedding/Initializer/random_uniform/mul"
  input: "single_second_embedding/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
      }
    }
  }
}
node {
  name: "single_second_embedding"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
          size: 10000
        }
        dim {
          size: 16
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
  name: "single_second_embedding/Assign"
  op: "Assign"
  input: "single_second_embedding"
  input: "single_second_embedding/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
  name: "single_second_embedding/read"
  op: "Identity"
  input: "single_second_embedding"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
      }
    }
  }
}
node {
  name: "numerical_second_embedding/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
        tensor_content: "\020\'\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "numerical_second_embedding/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
        float_val: -0.024475324898958206
      }
    }
  }
}
node {
  name: "numerical_second_embedding/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
        float_val: 0.024475324898958206
      }
    }
  }
}
node {
  name: "numerical_second_embedding/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "numerical_second_embedding/Initializer/random_uniform/shape"
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
        s: "loc:@numerical_second_embedding"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "numerical_second_embedding/Initializer/random_uniform/sub"
  op: "Sub"
  input: "numerical_second_embedding/Initializer/random_uniform/max"
  input: "numerical_second_embedding/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
      }
    }
  }
}
node {
  name: "numerical_second_embedding/Initializer/random_uniform/mul"
  op: "Mul"
  input: "numerical_second_embedding/Initializer/random_uniform/RandomUniform"
  input: "numerical_second_embedding/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
      }
    }
  }
}
node {
  name: "numerical_second_embedding/Initializer/random_uniform"
  op: "Add"
  input: "numerical_second_embedding/Initializer/random_uniform/mul"
  input: "numerical_second_embedding/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
      }
    }
  }
}
node {
  name: "numerical_second_embedding"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
          size: 10000
        }
        dim {
          size: 16
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
  name: "numerical_second_embedding/Assign"
  op: "Assign"
  input: "numerical_second_embedding"
  input: "numerical_second_embedding/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
  name: "numerical_second_embedding/read"
  op: "Identity"
  input: "numerical_second_embedding"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
      }
    }
  }
}
node {
  name: "single_first_embedding/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
        tensor_content: "\020\'\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "single_first_embedding/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
        float_val: -0.02449367195367813
      }
    }
  }
}
node {
  name: "single_first_embedding/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
        float_val: 0.02449367195367813
      }
    }
  }
}
node {
  name: "single_first_embedding/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "single_first_embedding/Initializer/random_uniform/shape"
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
        s: "loc:@single_first_embedding"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "single_first_embedding/Initializer/random_uniform/sub"
  op: "Sub"
  input: "single_first_embedding/Initializer/random_uniform/max"
  input: "single_first_embedding/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
      }
    }
  }
}
node {
  name: "single_first_embedding/Initializer/random_uniform/mul"
  op: "Mul"
  input: "single_first_embedding/Initializer/random_uniform/RandomUniform"
  input: "single_first_embedding/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
      }
    }
  }
}
node {
  name: "single_first_embedding/Initializer/random_uniform"
  op: "Add"
  input: "single_first_embedding/Initializer/random_uniform/mul"
  input: "single_first_embedding/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
      }
    }
  }
}
node {
  name: "single_first_embedding"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
          size: 10000
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
  name: "single_first_embedding/Assign"
  op: "Assign"
  input: "single_first_embedding"
  input: "single_first_embedding/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
  name: "single_first_embedding/read"
  op: "Identity"
  input: "single_first_embedding"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
      }
    }
  }
}
node {
  name: "numerical_first_embedding/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
        tensor_content: "\020\'\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "numerical_first_embedding/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
        float_val: -0.02449367195367813
      }
    }
  }
}
node {
  name: "numerical_first_embedding/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
        float_val: 0.02449367195367813
      }
    }
  }
}
node {
  name: "numerical_first_embedding/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "numerical_first_embedding/Initializer/random_uniform/shape"
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
        s: "loc:@numerical_first_embedding"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "numerical_first_embedding/Initializer/random_uniform/sub"
  op: "Sub"
  input: "numerical_first_embedding/Initializer/random_uniform/max"
  input: "numerical_first_embedding/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
      }
    }
  }
}
node {
  name: "numerical_first_embedding/Initializer/random_uniform/mul"
  op: "Mul"
  input: "numerical_first_embedding/Initializer/random_uniform/RandomUniform"
  input: "numerical_first_embedding/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
      }
    }
  }
}
node {
  name: "numerical_first_embedding/Initializer/random_uniform"
  op: "Add"
  input: "numerical_first_embedding/Initializer/random_uniform/mul"
  input: "numerical_first_embedding/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
      }
    }
  }
}
node {
  name: "numerical_first_embedding"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
          size: 10000
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
  name: "numerical_first_embedding/Assign"
  op: "Assign"
  input: "numerical_first_embedding"
  input: "numerical_first_embedding/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
  name: "numerical_first_embedding/read"
  op: "Identity"
  input: "numerical_first_embedding"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
      }
    }
  }
}
node {
  name: "W_0/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
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
        tensor_content: ")\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "W_0/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
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
        float_val: -0.188422292470932
      }
    }
  }
}
node {
  name: "W_0/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
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
        float_val: 0.188422292470932
      }
    }
  }
}
node {
  name: "W_0/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "W_0/Initializer/random_uniform/shape"
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
        s: "loc:@W_0"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "W_0/Initializer/random_uniform/sub"
  op: "Sub"
  input: "W_0/Initializer/random_uniform/max"
  input: "W_0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
      }
    }
  }
}
node {
  name: "W_0/Initializer/random_uniform/mul"
  op: "Mul"
  input: "W_0/Initializer/random_uniform/RandomUniform"
  input: "W_0/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
      }
    }
  }
}
node {
  name: "W_0/Initializer/random_uniform"
  op: "Add"
  input: "W_0/Initializer/random_uniform/mul"
  input: "W_0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
      }
    }
  }
}
node {
  name: "W_0"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
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
          size: 41
        }
        dim {
          size: 128
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
  name: "W_0/Assign"
  op: "Assign"
  input: "W_0"
  input: "W_0/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
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
  name: "W_0/read"
  op: "Identity"
  input: "W_0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
      }
    }
  }
}
node {
  name: "b_0/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_0"
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
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "b_0"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_0"
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
          size: 128
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
  name: "b_0/Assign"
  op: "Assign"
  input: "b_0"
  input: "b_0/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_0"
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
  name: "b_0/read"
  op: "Identity"
  input: "b_0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_0"
      }
    }
  }
}
node {
  name: "W_1/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
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
        tensor_content: "\200\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "W_1/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
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
        float_val: -0.1767766922712326
      }
    }
  }
}
node {
  name: "W_1/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
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
        float_val: 0.1767766922712326
      }
    }
  }
}
node {
  name: "W_1/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "W_1/Initializer/random_uniform/shape"
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
        s: "loc:@W_1"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "W_1/Initializer/random_uniform/sub"
  op: "Sub"
  input: "W_1/Initializer/random_uniform/max"
  input: "W_1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
      }
    }
  }
}
node {
  name: "W_1/Initializer/random_uniform/mul"
  op: "Mul"
  input: "W_1/Initializer/random_uniform/RandomUniform"
  input: "W_1/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
      }
    }
  }
}
node {
  name: "W_1/Initializer/random_uniform"
  op: "Add"
  input: "W_1/Initializer/random_uniform/mul"
  input: "W_1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
      }
    }
  }
}
node {
  name: "W_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
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
          size: 128
        }
        dim {
          size: 64
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
  name: "W_1/Assign"
  op: "Assign"
  input: "W_1"
  input: "W_1/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
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
  name: "W_1/read"
  op: "Identity"
  input: "W_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
      }
    }
  }
}
node {
  name: "b_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_1"
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
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "b_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_1"
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
          size: 64
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
  name: "b_1/Assign"
  op: "Assign"
  input: "b_1"
  input: "b_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_1"
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
  name: "b_1/read"
  op: "Identity"
  input: "b_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_1"
      }
    }
  }
}
node {
  name: "W_2/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
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
        tensor_content: "@\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "W_2/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
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
        float_val: -0.25
      }
    }
  }
}
node {
  name: "W_2/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
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
        float_val: 0.25
      }
    }
  }
}
node {
  name: "W_2/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "W_2/Initializer/random_uniform/shape"
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
        s: "loc:@W_2"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "W_2/Initializer/random_uniform/sub"
  op: "Sub"
  input: "W_2/Initializer/random_uniform/max"
  input: "W_2/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
      }
    }
  }
}
node {
  name: "W_2/Initializer/random_uniform/mul"
  op: "Mul"
  input: "W_2/Initializer/random_uniform/RandomUniform"
  input: "W_2/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
      }
    }
  }
}
node {
  name: "W_2/Initializer/random_uniform"
  op: "Add"
  input: "W_2/Initializer/random_uniform/mul"
  input: "W_2/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
      }
    }
  }
}
node {
  name: "W_2"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
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
          size: 64
        }
        dim {
          size: 32
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
  name: "W_2/Assign"
  op: "Assign"
  input: "W_2"
  input: "W_2/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
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
  name: "W_2/read"
  op: "Identity"
  input: "W_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
      }
    }
  }
}
node {
  name: "b_2/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_2"
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
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "b_2"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_2"
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
          size: 32
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
  name: "b_2/Assign"
  op: "Assign"
  input: "b_2"
  input: "b_2/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_2"
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
  name: "b_2/read"
  op: "Identity"
  input: "b_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_2"
      }
    }
  }
}
node {
  name: "embedding_lookup/axis"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
  name: "embedding_lookup"
  op: "GatherV2"
  input: "single_first_embedding/read"
  input: "Placeholder_2"
  input: "embedding_lookup/axis"
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
        s: "loc:@single_first_embedding"
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
  name: "embedding_lookup/Identity"
  op: "Identity"
  input: "embedding_lookup"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "\377\377\377\377\002\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape"
  op: "Reshape"
  input: "embedding_lookup/Identity"
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
  name: "embedding_lookup_1/axis"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
  name: "embedding_lookup_1"
  op: "GatherV2"
  input: "numerical_first_embedding/read"
  input: "Placeholder_3"
  input: "embedding_lookup_1/axis"
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
        s: "loc:@numerical_first_embedding"
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
  name: "embedding_lookup_1/Identity"
  op: "Identity"
  input: "embedding_lookup_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "\377\377\377\377\t\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape_1"
  op: "Reshape"
  input: "embedding_lookup_1/Identity"
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
        int_val: 1
      }
    }
  }
}
node {
  name: "concat"
  op: "ConcatV2"
  input: "Reshape"
  input: "Reshape_1"
  input: "concat/axis"
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
  name: "Mul"
  op: "Mul"
  input: "concat"
  input: "Placeholder_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "embedding_lookup_2/axis"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
  name: "embedding_lookup_2"
  op: "GatherV2"
  input: "single_second_embedding/read"
  input: "Placeholder_2"
  input: "embedding_lookup_2/axis"
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
        s: "loc:@single_second_embedding"
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
  name: "embedding_lookup_2/Identity"
  op: "Identity"
  input: "embedding_lookup_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Reshape_2/shape"
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
        tensor_content: "\377\377\377\377 \000\000\000"
      }
    }
  }
}
node {
  name: "Reshape_2"
  op: "Reshape"
  input: "embedding_lookup_2/Identity"
  input: "Reshape_2/shape"
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
  name: "embedding_lookup_3/axis"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
  name: "embedding_lookup_3"
  op: "GatherV2"
  input: "numerical_second_embedding/read"
  input: "Placeholder_3"
  input: "embedding_lookup_3/axis"
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
        s: "loc:@numerical_second_embedding"
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
  name: "embedding_lookup_3/Identity"
  op: "Identity"
  input: "embedding_lookup_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Reshape_3/shape"
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
        tensor_content: "\377\377\377\377\220\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape_3"
  op: "Reshape"
  input: "embedding_lookup_3/Identity"
  input: "Reshape_3/shape"
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
  name: "concat_1/concat_dim"
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
  name: "concat_1"
  op: "Identity"
  input: "Reshape_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
  input: "concat_1"
  input: "Reshape_3"
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
  input: "concat_1"
  input: "Placeholder_4"
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
  name: "Shape"
  op: "Shape"
  input: "concat_3"
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
  name: "Reshape_4/shape"
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
        tensor_content: "\377\377\377\377\013\000\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape_4"
  op: "Reshape"
  input: "concat_2"
  input: "Reshape_4/shape"
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
  input: "Reshape_4"
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
  name: "Square"
  op: "Square"
  input: "Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Square_1"
  op: "Square"
  input: "Reshape_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
  input: "Square_1"
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
  name: "Sub"
  op: "Sub"
  input: "Square"
  input: "Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_1/x"
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
        float_val: 0.5
      }
    }
  }
}
node {
  name: "mul_1"
  op: "Mul"
  input: "mul_1/x"
  input: "Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MatMul"
  op: "MatMul"
  input: "concat_3"
  input: "W_0/read"
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
  name: "Add"
  op: "Add"
  input: "MatMul"
  input: "b_0/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/gamma"
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
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "batch_normalization/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/gamma"
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
          size: 128
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
  name: "batch_normalization/gamma/Assign"
  op: "Assign"
  input: "batch_normalization/gamma"
  input: "batch_normalization/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/gamma"
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
  name: "batch_normalization/gamma/read"
  op: "Identity"
  input: "batch_normalization/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/gamma"
      }
    }
  }
}
node {
  name: "batch_normalization/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/beta"
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
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "batch_normalization/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/beta"
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
          size: 128
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
  name: "batch_normalization/beta/Assign"
  op: "Assign"
  input: "batch_normalization/beta"
  input: "batch_normalization/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/beta"
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
  name: "batch_normalization/beta/read"
  op: "Identity"
  input: "batch_normalization/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/beta"
      }
    }
  }
}
node {
  name: "batch_normalization/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
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
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "batch_normalization/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
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
          size: 128
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
  name: "batch_normalization/moving_mean/Assign"
  op: "Assign"
  input: "batch_normalization/moving_mean"
  input: "batch_normalization/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
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
  name: "batch_normalization/moving_mean/read"
  op: "Identity"
  input: "batch_normalization/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
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
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "batch_normalization/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
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
          size: 128
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
  name: "batch_normalization/moving_variance/Assign"
  op: "Assign"
  input: "batch_normalization/moving_variance"
  input: "batch_normalization/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
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
  name: "batch_normalization/moving_variance/read"
  op: "Identity"
  input: "batch_normalization/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization/moments/mean/reduction_indices"
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
  name: "batch_normalization/moments/mean"
  op: "Mean"
  input: "Add"
  input: "batch_normalization/moments/mean/reduction_indices"
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
  name: "batch_normalization/moments/StopGradient"
  op: "StopGradient"
  input: "batch_normalization/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "Add"
  input: "batch_normalization/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization/moments/variance/reduction_indices"
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
  name: "batch_normalization/moments/variance"
  op: "Mean"
  input: "batch_normalization/moments/SquaredDifference"
  input: "batch_normalization/moments/variance/reduction_indices"
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
  name: "batch_normalization/moments/Squeeze"
  op: "Squeeze"
  input: "batch_normalization/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
      }
    }
  }
}
node {
  name: "batch_normalization/moments/Squeeze_1"
  op: "Squeeze"
  input: "batch_normalization/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
      }
    }
  }
}
node {
  name: "batch_normalization/cond/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond/switch_t"
  op: "Identity"
  input: "batch_normalization/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond/switch_f"
  op: "Identity"
  input: "batch_normalization/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond/Switch_1"
  op: "Switch"
  input: "batch_normalization/moments/Squeeze"
  input: "batch_normalization/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moments/Squeeze"
      }
    }
  }
}
node {
  name: "batch_normalization/cond/Switch_2"
  op: "Switch"
  input: "batch_normalization/moving_mean/read"
  input: "batch_normalization/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization/cond/Merge"
  op: "Merge"
  input: "batch_normalization/cond/Switch_2"
  input: "batch_normalization/cond/Switch_1:1"
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
}
node {
  name: "batch_normalization/cond_1/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_1/switch_t"
  op: "Identity"
  input: "batch_normalization/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_1/switch_f"
  op: "Identity"
  input: "batch_normalization/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_1/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_1/Switch_1"
  op: "Switch"
  input: "batch_normalization/moments/Squeeze_1"
  input: "batch_normalization/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moments/Squeeze_1"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_1/Switch_2"
  op: "Switch"
  input: "batch_normalization/moving_variance/read"
  input: "batch_normalization/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_1/Merge"
  op: "Merge"
  input: "batch_normalization/cond_1/Switch_2"
  input: "batch_normalization/cond_1/Switch_1:1"
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
}
node {
  name: "batch_normalization/cond_2/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_2/switch_t"
  op: "Identity"
  input: "batch_normalization/cond_2/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_2/switch_f"
  op: "Identity"
  input: "batch_normalization/cond_2/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_2/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_2/AssignMovingAvg/decay"
  op: "Const"
  input: "^batch_normalization/cond_2/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
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
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "batch_normalization/cond_2/AssignMovingAvg/sub"
  op: "Sub"
  input: "batch_normalization/cond_2/AssignMovingAvg/sub/Switch:1"
  input: "batch_normalization/cond_2/AssignMovingAvg/sub/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_2/AssignMovingAvg/sub/Switch"
  op: "Switch"
  input: "batch_normalization/moving_mean/read"
  input: "batch_normalization/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_2/AssignMovingAvg/sub/Switch_1"
  op: "Switch"
  input: "batch_normalization/cond/Merge"
  input: "batch_normalization/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/cond/Merge"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_2/AssignMovingAvg/mul"
  op: "Mul"
  input: "batch_normalization/cond_2/AssignMovingAvg/sub"
  input: "batch_normalization/cond_2/AssignMovingAvg/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_2/AssignMovingAvg"
  op: "AssignSub"
  input: "batch_normalization/cond_2/AssignMovingAvg/Switch:1"
  input: "batch_normalization/cond_2/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
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
  name: "batch_normalization/cond_2/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "batch_normalization/moving_mean"
  input: "batch_normalization/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_2/Switch_1"
  op: "Switch"
  input: "batch_normalization/moving_mean/read"
  input: "batch_normalization/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_2/Merge"
  op: "Merge"
  input: "batch_normalization/cond_2/Switch_1"
  input: "batch_normalization/cond_2/AssignMovingAvg"
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
}
node {
  name: "batch_normalization/cond_3/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_3/switch_t"
  op: "Identity"
  input: "batch_normalization/cond_3/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_3/switch_f"
  op: "Identity"
  input: "batch_normalization/cond_3/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_3/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization/cond_3/AssignMovingAvg/decay"
  op: "Const"
  input: "^batch_normalization/cond_3/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
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
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "batch_normalization/cond_3/AssignMovingAvg/sub"
  op: "Sub"
  input: "batch_normalization/cond_3/AssignMovingAvg/sub/Switch:1"
  input: "batch_normalization/cond_3/AssignMovingAvg/sub/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_3/AssignMovingAvg/sub/Switch"
  op: "Switch"
  input: "batch_normalization/moving_variance/read"
  input: "batch_normalization/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_3/AssignMovingAvg/sub/Switch_1"
  op: "Switch"
  input: "batch_normalization/cond_1/Merge"
  input: "batch_normalization/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/cond_1/Merge"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_3/AssignMovingAvg/mul"
  op: "Mul"
  input: "batch_normalization/cond_3/AssignMovingAvg/sub"
  input: "batch_normalization/cond_3/AssignMovingAvg/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_3/AssignMovingAvg"
  op: "AssignSub"
  input: "batch_normalization/cond_3/AssignMovingAvg/Switch:1"
  input: "batch_normalization/cond_3/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
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
  name: "batch_normalization/cond_3/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "batch_normalization/moving_variance"
  input: "batch_normalization/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_3/Switch_1"
  op: "Switch"
  input: "batch_normalization/moving_variance/read"
  input: "batch_normalization/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization/cond_3/Merge"
  op: "Merge"
  input: "batch_normalization/cond_3/Switch_1"
  input: "batch_normalization/cond_3/AssignMovingAvg"
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
}
node {
  name: "batch_normalization/batchnorm/add/y"
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
  name: "batch_normalization/batchnorm/add"
  op: "Add"
  input: "batch_normalization/cond_1/Merge"
  input: "batch_normalization/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "batch_normalization/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization/batchnorm/mul"
  op: "Mul"
  input: "batch_normalization/batchnorm/Rsqrt"
  input: "batch_normalization/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization/batchnorm/mul_1"
  op: "Mul"
  input: "Add"
  input: "batch_normalization/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization/batchnorm/mul_2"
  op: "Mul"
  input: "batch_normalization/cond/Merge"
  input: "batch_normalization/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization/batchnorm/sub"
  op: "Sub"
  input: "batch_normalization/beta/read"
  input: "batch_normalization/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization/batchnorm/add_1"
  op: "Add"
  input: "batch_normalization/batchnorm/mul_1"
  input: "batch_normalization/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Relu"
  op: "Relu"
  input: "batch_normalization/batchnorm/add_1"
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
  input: "batch_normalization/batchnorm/add_1"
  input: "W_1/read"
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
  name: "Add_1"
  op: "Add"
  input: "MatMul_1"
  input: "b_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_1/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/gamma"
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
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "batch_normalization_1/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/gamma"
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
          size: 64
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
  name: "batch_normalization_1/gamma/Assign"
  op: "Assign"
  input: "batch_normalization_1/gamma"
  input: "batch_normalization_1/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/gamma"
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
  name: "batch_normalization_1/gamma/read"
  op: "Identity"
  input: "batch_normalization_1/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/gamma"
      }
    }
  }
}
node {
  name: "batch_normalization_1/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/beta"
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
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "batch_normalization_1/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/beta"
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
          size: 64
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
  name: "batch_normalization_1/beta/Assign"
  op: "Assign"
  input: "batch_normalization_1/beta"
  input: "batch_normalization_1/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/beta"
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
  name: "batch_normalization_1/beta/read"
  op: "Identity"
  input: "batch_normalization_1/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/beta"
      }
    }
  }
}
node {
  name: "batch_normalization_1/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
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
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "batch_normalization_1/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
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
          size: 64
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
  name: "batch_normalization_1/moving_mean/Assign"
  op: "Assign"
  input: "batch_normalization_1/moving_mean"
  input: "batch_normalization_1/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
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
  name: "batch_normalization_1/moving_mean/read"
  op: "Identity"
  input: "batch_normalization_1/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_1/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
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
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "batch_normalization_1/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
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
          size: 64
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
  name: "batch_normalization_1/moving_variance/Assign"
  op: "Assign"
  input: "batch_normalization_1/moving_variance"
  input: "batch_normalization_1/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
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
  name: "batch_normalization_1/moving_variance/read"
  op: "Identity"
  input: "batch_normalization_1/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_1/moments/mean/reduction_indices"
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
  name: "batch_normalization_1/moments/mean"
  op: "Mean"
  input: "Add_1"
  input: "batch_normalization_1/moments/mean/reduction_indices"
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
  name: "batch_normalization_1/moments/StopGradient"
  op: "StopGradient"
  input: "batch_normalization_1/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_1/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "Add_1"
  input: "batch_normalization_1/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_1/moments/variance/reduction_indices"
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
  name: "batch_normalization_1/moments/variance"
  op: "Mean"
  input: "batch_normalization_1/moments/SquaredDifference"
  input: "batch_normalization_1/moments/variance/reduction_indices"
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
  name: "batch_normalization_1/moments/Squeeze"
  op: "Squeeze"
  input: "batch_normalization_1/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
      }
    }
  }
}
node {
  name: "batch_normalization_1/moments/Squeeze_1"
  op: "Squeeze"
  input: "batch_normalization_1/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond/switch_t"
  op: "Identity"
  input: "batch_normalization_1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond/switch_f"
  op: "Identity"
  input: "batch_normalization_1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond/Switch_1"
  op: "Switch"
  input: "batch_normalization_1/moments/Squeeze"
  input: "batch_normalization_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moments/Squeeze"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond/Switch_2"
  op: "Switch"
  input: "batch_normalization_1/moving_mean/read"
  input: "batch_normalization_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond/Merge"
  op: "Merge"
  input: "batch_normalization_1/cond/Switch_2"
  input: "batch_normalization_1/cond/Switch_1:1"
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
}
node {
  name: "batch_normalization_1/cond_1/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_1/switch_t"
  op: "Identity"
  input: "batch_normalization_1/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_1/switch_f"
  op: "Identity"
  input: "batch_normalization_1/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_1/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_1/Switch_1"
  op: "Switch"
  input: "batch_normalization_1/moments/Squeeze_1"
  input: "batch_normalization_1/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moments/Squeeze_1"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_1/Switch_2"
  op: "Switch"
  input: "batch_normalization_1/moving_variance/read"
  input: "batch_normalization_1/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_1/Merge"
  op: "Merge"
  input: "batch_normalization_1/cond_1/Switch_2"
  input: "batch_normalization_1/cond_1/Switch_1:1"
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
}
node {
  name: "batch_normalization_1/cond_2/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_2/switch_t"
  op: "Identity"
  input: "batch_normalization_1/cond_2/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_2/switch_f"
  op: "Identity"
  input: "batch_normalization_1/cond_2/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_2/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_2/AssignMovingAvg/decay"
  op: "Const"
  input: "^batch_normalization_1/cond_2/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
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
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_2/AssignMovingAvg/sub"
  op: "Sub"
  input: "batch_normalization_1/cond_2/AssignMovingAvg/sub/Switch:1"
  input: "batch_normalization_1/cond_2/AssignMovingAvg/sub/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_2/AssignMovingAvg/sub/Switch"
  op: "Switch"
  input: "batch_normalization_1/moving_mean/read"
  input: "batch_normalization_1/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_2/AssignMovingAvg/sub/Switch_1"
  op: "Switch"
  input: "batch_normalization_1/cond/Merge"
  input: "batch_normalization_1/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/cond/Merge"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_2/AssignMovingAvg/mul"
  op: "Mul"
  input: "batch_normalization_1/cond_2/AssignMovingAvg/sub"
  input: "batch_normalization_1/cond_2/AssignMovingAvg/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_2/AssignMovingAvg"
  op: "AssignSub"
  input: "batch_normalization_1/cond_2/AssignMovingAvg/Switch:1"
  input: "batch_normalization_1/cond_2/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
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
  name: "batch_normalization_1/cond_2/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "batch_normalization_1/moving_mean"
  input: "batch_normalization_1/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_2/Switch_1"
  op: "Switch"
  input: "batch_normalization_1/moving_mean/read"
  input: "batch_normalization_1/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_2/Merge"
  op: "Merge"
  input: "batch_normalization_1/cond_2/Switch_1"
  input: "batch_normalization_1/cond_2/AssignMovingAvg"
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
}
node {
  name: "batch_normalization_1/cond_3/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_3/switch_t"
  op: "Identity"
  input: "batch_normalization_1/cond_3/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_3/switch_f"
  op: "Identity"
  input: "batch_normalization_1/cond_3/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_3/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_1/cond_3/AssignMovingAvg/decay"
  op: "Const"
  input: "^batch_normalization_1/cond_3/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
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
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_3/AssignMovingAvg/sub"
  op: "Sub"
  input: "batch_normalization_1/cond_3/AssignMovingAvg/sub/Switch:1"
  input: "batch_normalization_1/cond_3/AssignMovingAvg/sub/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_3/AssignMovingAvg/sub/Switch"
  op: "Switch"
  input: "batch_normalization_1/moving_variance/read"
  input: "batch_normalization_1/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_3/AssignMovingAvg/sub/Switch_1"
  op: "Switch"
  input: "batch_normalization_1/cond_1/Merge"
  input: "batch_normalization_1/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/cond_1/Merge"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_3/AssignMovingAvg/mul"
  op: "Mul"
  input: "batch_normalization_1/cond_3/AssignMovingAvg/sub"
  input: "batch_normalization_1/cond_3/AssignMovingAvg/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_3/AssignMovingAvg"
  op: "AssignSub"
  input: "batch_normalization_1/cond_3/AssignMovingAvg/Switch:1"
  input: "batch_normalization_1/cond_3/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
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
  name: "batch_normalization_1/cond_3/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "batch_normalization_1/moving_variance"
  input: "batch_normalization_1/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_3/Switch_1"
  op: "Switch"
  input: "batch_normalization_1/moving_variance/read"
  input: "batch_normalization_1/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_1/cond_3/Merge"
  op: "Merge"
  input: "batch_normalization_1/cond_3/Switch_1"
  input: "batch_normalization_1/cond_3/AssignMovingAvg"
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
}
node {
  name: "batch_normalization_1/batchnorm/add/y"
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
  name: "batch_normalization_1/batchnorm/add"
  op: "Add"
  input: "batch_normalization_1/cond_1/Merge"
  input: "batch_normalization_1/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_1/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "batch_normalization_1/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_1/batchnorm/mul"
  op: "Mul"
  input: "batch_normalization_1/batchnorm/Rsqrt"
  input: "batch_normalization_1/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_1/batchnorm/mul_1"
  op: "Mul"
  input: "Add_1"
  input: "batch_normalization_1/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_1/batchnorm/mul_2"
  op: "Mul"
  input: "batch_normalization_1/cond/Merge"
  input: "batch_normalization_1/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_1/batchnorm/sub"
  op: "Sub"
  input: "batch_normalization_1/beta/read"
  input: "batch_normalization_1/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_1/batchnorm/add_1"
  op: "Add"
  input: "batch_normalization_1/batchnorm/mul_1"
  input: "batch_normalization_1/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Relu_1"
  op: "Relu"
  input: "batch_normalization_1/batchnorm/add_1"
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
  input: "batch_normalization_1/batchnorm/add_1"
  input: "W_2/read"
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
  name: "Add_2"
  op: "Add"
  input: "MatMul_2"
  input: "b_2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_2/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/gamma"
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
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "batch_normalization_2/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/gamma"
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
          size: 32
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
  name: "batch_normalization_2/gamma/Assign"
  op: "Assign"
  input: "batch_normalization_2/gamma"
  input: "batch_normalization_2/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/gamma"
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
  name: "batch_normalization_2/gamma/read"
  op: "Identity"
  input: "batch_normalization_2/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/gamma"
      }
    }
  }
}
node {
  name: "batch_normalization_2/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/beta"
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
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "batch_normalization_2/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/beta"
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
          size: 32
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
  name: "batch_normalization_2/beta/Assign"
  op: "Assign"
  input: "batch_normalization_2/beta"
  input: "batch_normalization_2/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/beta"
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
  name: "batch_normalization_2/beta/read"
  op: "Identity"
  input: "batch_normalization_2/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/beta"
      }
    }
  }
}
node {
  name: "batch_normalization_2/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
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
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "batch_normalization_2/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
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
          size: 32
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
  name: "batch_normalization_2/moving_mean/Assign"
  op: "Assign"
  input: "batch_normalization_2/moving_mean"
  input: "batch_normalization_2/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
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
  name: "batch_normalization_2/moving_mean/read"
  op: "Identity"
  input: "batch_normalization_2/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_2/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
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
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "batch_normalization_2/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
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
          size: 32
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
  name: "batch_normalization_2/moving_variance/Assign"
  op: "Assign"
  input: "batch_normalization_2/moving_variance"
  input: "batch_normalization_2/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
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
  name: "batch_normalization_2/moving_variance/read"
  op: "Identity"
  input: "batch_normalization_2/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_2/moments/mean/reduction_indices"
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
  name: "batch_normalization_2/moments/mean"
  op: "Mean"
  input: "Add_2"
  input: "batch_normalization_2/moments/mean/reduction_indices"
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
  name: "batch_normalization_2/moments/StopGradient"
  op: "StopGradient"
  input: "batch_normalization_2/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_2/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "Add_2"
  input: "batch_normalization_2/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_2/moments/variance/reduction_indices"
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
  name: "batch_normalization_2/moments/variance"
  op: "Mean"
  input: "batch_normalization_2/moments/SquaredDifference"
  input: "batch_normalization_2/moments/variance/reduction_indices"
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
  name: "batch_normalization_2/moments/Squeeze"
  op: "Squeeze"
  input: "batch_normalization_2/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
      }
    }
  }
}
node {
  name: "batch_normalization_2/moments/Squeeze_1"
  op: "Squeeze"
  input: "batch_normalization_2/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond/switch_t"
  op: "Identity"
  input: "batch_normalization_2/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond/switch_f"
  op: "Identity"
  input: "batch_normalization_2/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond/Switch_1"
  op: "Switch"
  input: "batch_normalization_2/moments/Squeeze"
  input: "batch_normalization_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moments/Squeeze"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond/Switch_2"
  op: "Switch"
  input: "batch_normalization_2/moving_mean/read"
  input: "batch_normalization_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond/Merge"
  op: "Merge"
  input: "batch_normalization_2/cond/Switch_2"
  input: "batch_normalization_2/cond/Switch_1:1"
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
}
node {
  name: "batch_normalization_2/cond_1/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_1/switch_t"
  op: "Identity"
  input: "batch_normalization_2/cond_1/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_1/switch_f"
  op: "Identity"
  input: "batch_normalization_2/cond_1/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_1/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_1/Switch_1"
  op: "Switch"
  input: "batch_normalization_2/moments/Squeeze_1"
  input: "batch_normalization_2/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moments/Squeeze_1"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_1/Switch_2"
  op: "Switch"
  input: "batch_normalization_2/moving_variance/read"
  input: "batch_normalization_2/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_1/Merge"
  op: "Merge"
  input: "batch_normalization_2/cond_1/Switch_2"
  input: "batch_normalization_2/cond_1/Switch_1:1"
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
}
node {
  name: "batch_normalization_2/cond_2/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_2/switch_t"
  op: "Identity"
  input: "batch_normalization_2/cond_2/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_2/switch_f"
  op: "Identity"
  input: "batch_normalization_2/cond_2/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_2/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_2/AssignMovingAvg/decay"
  op: "Const"
  input: "^batch_normalization_2/cond_2/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
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
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_2/AssignMovingAvg/sub"
  op: "Sub"
  input: "batch_normalization_2/cond_2/AssignMovingAvg/sub/Switch:1"
  input: "batch_normalization_2/cond_2/AssignMovingAvg/sub/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_2/AssignMovingAvg/sub/Switch"
  op: "Switch"
  input: "batch_normalization_2/moving_mean/read"
  input: "batch_normalization_2/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_2/AssignMovingAvg/sub/Switch_1"
  op: "Switch"
  input: "batch_normalization_2/cond/Merge"
  input: "batch_normalization_2/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/cond/Merge"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_2/AssignMovingAvg/mul"
  op: "Mul"
  input: "batch_normalization_2/cond_2/AssignMovingAvg/sub"
  input: "batch_normalization_2/cond_2/AssignMovingAvg/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_2/AssignMovingAvg"
  op: "AssignSub"
  input: "batch_normalization_2/cond_2/AssignMovingAvg/Switch:1"
  input: "batch_normalization_2/cond_2/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
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
  name: "batch_normalization_2/cond_2/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "batch_normalization_2/moving_mean"
  input: "batch_normalization_2/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_2/Switch_1"
  op: "Switch"
  input: "batch_normalization_2/moving_mean/read"
  input: "batch_normalization_2/cond_2/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_mean"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_2/Merge"
  op: "Merge"
  input: "batch_normalization_2/cond_2/Switch_1"
  input: "batch_normalization_2/cond_2/AssignMovingAvg"
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
}
node {
  name: "batch_normalization_2/cond_3/Switch"
  op: "Switch"
  input: "train_phase"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_3/switch_t"
  op: "Identity"
  input: "batch_normalization_2/cond_3/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_3/switch_f"
  op: "Identity"
  input: "batch_normalization_2/cond_3/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_3/pred_id"
  op: "Identity"
  input: "train_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "batch_normalization_2/cond_3/AssignMovingAvg/decay"
  op: "Const"
  input: "^batch_normalization_2/cond_3/switch_t"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
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
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_3/AssignMovingAvg/sub"
  op: "Sub"
  input: "batch_normalization_2/cond_3/AssignMovingAvg/sub/Switch:1"
  input: "batch_normalization_2/cond_3/AssignMovingAvg/sub/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_3/AssignMovingAvg/sub/Switch"
  op: "Switch"
  input: "batch_normalization_2/moving_variance/read"
  input: "batch_normalization_2/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_3/AssignMovingAvg/sub/Switch_1"
  op: "Switch"
  input: "batch_normalization_2/cond_1/Merge"
  input: "batch_normalization_2/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/cond_1/Merge"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_3/AssignMovingAvg/mul"
  op: "Mul"
  input: "batch_normalization_2/cond_3/AssignMovingAvg/sub"
  input: "batch_normalization_2/cond_3/AssignMovingAvg/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_3/AssignMovingAvg"
  op: "AssignSub"
  input: "batch_normalization_2/cond_3/AssignMovingAvg/Switch:1"
  input: "batch_normalization_2/cond_3/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
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
  name: "batch_normalization_2/cond_3/AssignMovingAvg/Switch"
  op: "RefSwitch"
  input: "batch_normalization_2/moving_variance"
  input: "batch_normalization_2/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_3/Switch_1"
  op: "Switch"
  input: "batch_normalization_2/moving_variance/read"
  input: "batch_normalization_2/cond_3/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/moving_variance"
      }
    }
  }
}
node {
  name: "batch_normalization_2/cond_3/Merge"
  op: "Merge"
  input: "batch_normalization_2/cond_3/Switch_1"
  input: "batch_normalization_2/cond_3/AssignMovingAvg"
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
}
node {
  name: "batch_normalization_2/batchnorm/add/y"
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
  name: "batch_normalization_2/batchnorm/add"
  op: "Add"
  input: "batch_normalization_2/cond_1/Merge"
  input: "batch_normalization_2/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_2/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "batch_normalization_2/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_2/batchnorm/mul"
  op: "Mul"
  input: "batch_normalization_2/batchnorm/Rsqrt"
  input: "batch_normalization_2/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_2/batchnorm/mul_1"
  op: "Mul"
  input: "Add_2"
  input: "batch_normalization_2/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_2/batchnorm/mul_2"
  op: "Mul"
  input: "batch_normalization_2/cond/Merge"
  input: "batch_normalization_2/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_2/batchnorm/sub"
  op: "Sub"
  input: "batch_normalization_2/beta/read"
  input: "batch_normalization_2/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "batch_normalization_2/batchnorm/add_1"
  op: "Add"
  input: "batch_normalization_2/batchnorm/mul_1"
  input: "batch_normalization_2/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Relu_2"
  op: "Relu"
  input: "batch_normalization_2/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Reshape_5/shape"
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
        tensor_content: "\377\377\377\377\013\000\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape_5"
  op: "Reshape"
  input: "Reshape_2"
  input: "Reshape_5/shape"
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
  name: "Const"
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
            size: 16
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "split/split_dim"
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
  name: "split"
  op: "SplitV"
  input: "Reshape_5"
  input: "Const"
  input: "split/split_dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tlen"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "num_split"
    value {
      i: 16
    }
  }
}
node {
  name: "Const_1"
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
            size: 16
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "split_1/split_dim"
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
  name: "split_1"
  op: "SplitV"
  input: "Reshape_5"
  input: "Const_1"
  input: "split_1/split_dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tlen"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "num_split"
    value {
      i: 16
    }
  }
}
node {
  name: "MatMul_3/a"
  op: "Pack"
  input: "split"
  input: "split:1"
  input: "split:2"
  input: "split:3"
  input: "split:4"
  input: "split:5"
  input: "split:6"
  input: "split:7"
  input: "split:8"
  input: "split:9"
  input: "split:10"
  input: "split:11"
  input: "split:12"
  input: "split:13"
  input: "split:14"
  input: "split:15"
  attr {
    key: "N"
    value {
      i: 16
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
  name: "MatMul_3/b"
  op: "Pack"
  input: "split_1"
  input: "split_1:1"
  input: "split_1:2"
  input: "split_1:3"
  input: "split_1:4"
  input: "split_1:5"
  input: "split_1:6"
  input: "split_1:7"
  input: "split_1:8"
  input: "split_1:9"
  input: "split_1:10"
  input: "split_1:11"
  input: "split_1:12"
  input: "split_1:13"
  input: "split_1:14"
  input: "split_1:15"
  attr {
    key: "N"
    value {
      i: 16
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
  name: "MatMul_3"
  op: "BatchMatMulV2"
  input: "MatMul_3/a"
  input: "MatMul_3/b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: true
    }
  }
}
node {
  name: "Reshape_6/shape"
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
        tensor_content: "\020\000\000\000\377\377\377\377y\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape_6"
  op: "Reshape"
  input: "MatMul_3"
  input: "Reshape_6/shape"
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
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "transpose"
  op: "Transpose"
  input: "Reshape_6"
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
  name: "f_0/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_0"
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
            size: 3
          }
        }
        tensor_content: "\001\000\000\000y\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "f_0/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_0"
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
        float_val: -0.21401290595531464
      }
    }
  }
}
node {
  name: "f_0/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_0"
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
        float_val: 0.21401290595531464
      }
    }
  }
}
node {
  name: "f_0/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "f_0/Initializer/random_uniform/shape"
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
        s: "loc:@f_0"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "f_0/Initializer/random_uniform/sub"
  op: "Sub"
  input: "f_0/Initializer/random_uniform/max"
  input: "f_0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_0"
      }
    }
  }
}
node {
  name: "f_0/Initializer/random_uniform/mul"
  op: "Mul"
  input: "f_0/Initializer/random_uniform/RandomUniform"
  input: "f_0/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_0"
      }
    }
  }
}
node {
  name: "f_0/Initializer/random_uniform"
  op: "Add"
  input: "f_0/Initializer/random_uniform/mul"
  input: "f_0/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_0"
      }
    }
  }
}
node {
  name: "f_0"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_0"
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
          size: 1
        }
        dim {
          size: 121
        }
        dim {
          size: 10
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
  name: "f_0/Assign"
  op: "Assign"
  input: "f_0"
  input: "f_0/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_0"
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
  name: "f_0/read"
  op: "Identity"
  input: "f_0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_0"
      }
    }
  }
}
node {
  name: "conv1d/ExpandDims/dim"
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
  name: "conv1d/ExpandDims"
  op: "ExpandDims"
  input: "transpose"
  input: "conv1d/ExpandDims/dim"
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
  name: "conv1d/ExpandDims_1/dim"
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
  name: "conv1d/ExpandDims_1"
  op: "ExpandDims"
  input: "f_0/read"
  input: "conv1d/ExpandDims_1/dim"
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
  name: "conv1d"
  op: "Conv2D"
  input: "conv1d/ExpandDims"
  input: "conv1d/ExpandDims_1"
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
  name: "conv1d/Squeeze"
  op: "Squeeze"
  input: "conv1d"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 1
      }
    }
  }
}
node {
  name: "f_b0/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b0"
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
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "f_b0"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b0"
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
          size: 10
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
  name: "f_b0/Assign"
  op: "Assign"
  input: "f_b0"
  input: "f_b0/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b0"
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
  name: "f_b0/read"
  op: "Identity"
  input: "f_b0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b0"
      }
    }
  }
}
node {
  name: "BiasAdd"
  op: "BiasAdd"
  input: "conv1d/Squeeze"
  input: "f_b0/read"
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
  name: "Relu_3"
  op: "Relu"
  input: "BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\002\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_1"
  op: "Transpose"
  input: "Relu_3"
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
  name: "Const_2"
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
        tensor_content: "\005\000\000\000\005\000\000\000"
      }
    }
  }
}
node {
  name: "split_2/split_dim"
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
  name: "split_2"
  op: "SplitV"
  input: "transpose_1"
  input: "Const_2"
  input: "split_2/split_dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tlen"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "num_split"
    value {
      i: 2
    }
  }
}
node {
  name: "Const_3"
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
            size: 16
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "split_3/split_dim"
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
  name: "split_3"
  op: "SplitV"
  input: "split_2"
  input: "Const_3"
  input: "split_3/split_dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tlen"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "num_split"
    value {
      i: 16
    }
  }
}
node {
  name: "MatMul_4/a"
  op: "Pack"
  input: "split"
  input: "split:1"
  input: "split:2"
  input: "split:3"
  input: "split:4"
  input: "split:5"
  input: "split:6"
  input: "split:7"
  input: "split:8"
  input: "split:9"
  input: "split:10"
  input: "split:11"
  input: "split:12"
  input: "split:13"
  input: "split:14"
  input: "split:15"
  attr {
    key: "N"
    value {
      i: 16
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
  name: "MatMul_4/b"
  op: "Pack"
  input: "split_3"
  input: "split_3:1"
  input: "split_3:2"
  input: "split_3:3"
  input: "split_3:4"
  input: "split_3:5"
  input: "split_3:6"
  input: "split_3:7"
  input: "split_3:8"
  input: "split_3:9"
  input: "split_3:10"
  input: "split_3:11"
  input: "split_3:12"
  input: "split_3:13"
  input: "split_3:14"
  input: "split_3:15"
  attr {
    key: "N"
    value {
      i: 16
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
  name: "MatMul_4"
  op: "BatchMatMulV2"
  input: "MatMul_4/a"
  input: "MatMul_4/b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: true
    }
  }
}
node {
  name: "Reshape_7/shape"
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
        tensor_content: "\020\000\000\000\377\377\377\3777\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape_7"
  op: "Reshape"
  input: "MatMul_4"
  input: "Reshape_7/shape"
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
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_2"
  op: "Transpose"
  input: "Reshape_7"
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
  name: "f_1/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_1"
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
            size: 3
          }
        }
        tensor_content: "\001\000\000\0007\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "f_1/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_1"
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
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "f_1/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_1"
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
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "f_1/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "f_1/Initializer/random_uniform/shape"
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
        s: "loc:@f_1"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "f_1/Initializer/random_uniform/sub"
  op: "Sub"
  input: "f_1/Initializer/random_uniform/max"
  input: "f_1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_1"
      }
    }
  }
}
node {
  name: "f_1/Initializer/random_uniform/mul"
  op: "Mul"
  input: "f_1/Initializer/random_uniform/RandomUniform"
  input: "f_1/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_1"
      }
    }
  }
}
node {
  name: "f_1/Initializer/random_uniform"
  op: "Add"
  input: "f_1/Initializer/random_uniform/mul"
  input: "f_1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_1"
      }
    }
  }
}
node {
  name: "f_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_1"
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
          size: 1
        }
        dim {
          size: 55
        }
        dim {
          size: 10
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
  name: "f_1/Assign"
  op: "Assign"
  input: "f_1"
  input: "f_1/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_1"
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
  name: "f_1/read"
  op: "Identity"
  input: "f_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_1"
      }
    }
  }
}
node {
  name: "conv1d_1/ExpandDims/dim"
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
  name: "conv1d_1/ExpandDims"
  op: "ExpandDims"
  input: "transpose_2"
  input: "conv1d_1/ExpandDims/dim"
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
  name: "conv1d_1/ExpandDims_1/dim"
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
  name: "conv1d_1/ExpandDims_1"
  op: "ExpandDims"
  input: "f_1/read"
  input: "conv1d_1/ExpandDims_1/dim"
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
  name: "conv1d_1"
  op: "Conv2D"
  input: "conv1d_1/ExpandDims"
  input: "conv1d_1/ExpandDims_1"
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
  name: "conv1d_1/Squeeze"
  op: "Squeeze"
  input: "conv1d_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 1
      }
    }
  }
}
node {
  name: "f_b1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b1"
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
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "f_b1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b1"
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
          size: 10
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
  name: "f_b1/Assign"
  op: "Assign"
  input: "f_b1"
  input: "f_b1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b1"
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
  name: "f_b1/read"
  op: "Identity"
  input: "f_b1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b1"
      }
    }
  }
}
node {
  name: "BiasAdd_1"
  op: "BiasAdd"
  input: "conv1d_1/Squeeze"
  input: "f_b1/read"
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
  name: "Relu_4"
  op: "Relu"
  input: "BiasAdd_1"
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
        tensor_content: "\000\000\000\000\002\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_3"
  op: "Transpose"
  input: "Relu_4"
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
  name: "Const_4"
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
        tensor_content: "\005\000\000\000\005\000\000\000"
      }
    }
  }
}
node {
  name: "split_4/split_dim"
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
  name: "split_4"
  op: "SplitV"
  input: "transpose_3"
  input: "Const_4"
  input: "split_4/split_dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tlen"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "num_split"
    value {
      i: 2
    }
  }
}
node {
  name: "Const_5"
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
            size: 16
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "split_5/split_dim"
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
  name: "split_5"
  op: "SplitV"
  input: "split_4"
  input: "Const_5"
  input: "split_5/split_dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tlen"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "num_split"
    value {
      i: 16
    }
  }
}
node {
  name: "MatMul_5/a"
  op: "Pack"
  input: "split"
  input: "split:1"
  input: "split:2"
  input: "split:3"
  input: "split:4"
  input: "split:5"
  input: "split:6"
  input: "split:7"
  input: "split:8"
  input: "split:9"
  input: "split:10"
  input: "split:11"
  input: "split:12"
  input: "split:13"
  input: "split:14"
  input: "split:15"
  attr {
    key: "N"
    value {
      i: 16
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
  name: "MatMul_5/b"
  op: "Pack"
  input: "split_5"
  input: "split_5:1"
  input: "split_5:2"
  input: "split_5:3"
  input: "split_5:4"
  input: "split_5:5"
  input: "split_5:6"
  input: "split_5:7"
  input: "split_5:8"
  input: "split_5:9"
  input: "split_5:10"
  input: "split_5:11"
  input: "split_5:12"
  input: "split_5:13"
  input: "split_5:14"
  input: "split_5:15"
  attr {
    key: "N"
    value {
      i: 16
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
  name: "MatMul_5"
  op: "BatchMatMulV2"
  input: "MatMul_5/a"
  input: "MatMul_5/b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: true
    }
  }
}
node {
  name: "Reshape_8/shape"
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
        tensor_content: "\020\000\000\000\377\377\377\3777\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape_8"
  op: "Reshape"
  input: "MatMul_5"
  input: "Reshape_8/shape"
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
  input: "Reshape_8"
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
  name: "f_2/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_2"
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
            size: 3
          }
        }
        tensor_content: "\001\000\000\0007\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "f_2/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_2"
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
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "f_2/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_2"
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
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "f_2/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "f_2/Initializer/random_uniform/shape"
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
        s: "loc:@f_2"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "f_2/Initializer/random_uniform/sub"
  op: "Sub"
  input: "f_2/Initializer/random_uniform/max"
  input: "f_2/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_2"
      }
    }
  }
}
node {
  name: "f_2/Initializer/random_uniform/mul"
  op: "Mul"
  input: "f_2/Initializer/random_uniform/RandomUniform"
  input: "f_2/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_2"
      }
    }
  }
}
node {
  name: "f_2/Initializer/random_uniform"
  op: "Add"
  input: "f_2/Initializer/random_uniform/mul"
  input: "f_2/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_2"
      }
    }
  }
}
node {
  name: "f_2"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_2"
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
          size: 1
        }
        dim {
          size: 55
        }
        dim {
          size: 10
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
  name: "f_2/Assign"
  op: "Assign"
  input: "f_2"
  input: "f_2/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_2"
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
  name: "f_2/read"
  op: "Identity"
  input: "f_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_2"
      }
    }
  }
}
node {
  name: "conv1d_2/ExpandDims/dim"
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
  name: "conv1d_2/ExpandDims"
  op: "ExpandDims"
  input: "transpose_4"
  input: "conv1d_2/ExpandDims/dim"
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
  name: "conv1d_2/ExpandDims_1/dim"
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
  name: "conv1d_2/ExpandDims_1"
  op: "ExpandDims"
  input: "f_2/read"
  input: "conv1d_2/ExpandDims_1/dim"
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
  name: "conv1d_2"
  op: "Conv2D"
  input: "conv1d_2/ExpandDims"
  input: "conv1d_2/ExpandDims_1"
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
  name: "conv1d_2/Squeeze"
  op: "Squeeze"
  input: "conv1d_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 1
      }
    }
  }
}
node {
  name: "f_b2/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b2"
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
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "f_b2"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b2"
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
          size: 10
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
  name: "f_b2/Assign"
  op: "Assign"
  input: "f_b2"
  input: "f_b2/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b2"
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
  name: "f_b2/read"
  op: "Identity"
  input: "f_b2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@f_b2"
      }
    }
  }
}
node {
  name: "BiasAdd_2"
  op: "BiasAdd"
  input: "conv1d_2/Squeeze"
  input: "f_b2/read"
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
  name: "Relu_5"
  op: "Relu"
  input: "BiasAdd_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "\000\000\000\000\002\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_5"
  op: "Transpose"
  input: "Relu_5"
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
  input: "split_2:1"
  input: "split_4:1"
  input: "transpose_5"
  input: "concat_4/axis"
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
  name: "Sum_2/reduction_indices"
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
  name: "Sum_2"
  op: "Sum"
  input: "concat_4"
  input: "Sum_2/reduction_indices"
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
  name: "w_nn_output1/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@w_nn_output1"
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
        tensor_content: "\024\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "w_nn_output1/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@w_nn_output1"
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
        float_val: -0.5345224738121033
      }
    }
  }
}
node {
  name: "w_nn_output1/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@w_nn_output1"
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
        float_val: 0.5345224738121033
      }
    }
  }
}
node {
  name: "w_nn_output1/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "w_nn_output1/Initializer/random_uniform/shape"
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
        s: "loc:@w_nn_output1"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "w_nn_output1/Initializer/random_uniform/sub"
  op: "Sub"
  input: "w_nn_output1/Initializer/random_uniform/max"
  input: "w_nn_output1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@w_nn_output1"
      }
    }
  }
}
node {
  name: "w_nn_output1/Initializer/random_uniform/mul"
  op: "Mul"
  input: "w_nn_output1/Initializer/random_uniform/RandomUniform"
  input: "w_nn_output1/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@w_nn_output1"
      }
    }
  }
}
node {
  name: "w_nn_output1/Initializer/random_uniform"
  op: "Add"
  input: "w_nn_output1/Initializer/random_uniform/mul"
  input: "w_nn_output1/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@w_nn_output1"
      }
    }
  }
}
node {
  name: "w_nn_output1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@w_nn_output1"
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
          size: 20
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
  name: "w_nn_output1/Assign"
  op: "Assign"
  input: "w_nn_output1"
  input: "w_nn_output1/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@w_nn_output1"
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
  name: "w_nn_output1/read"
  op: "Identity"
  input: "w_nn_output1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@w_nn_output1"
      }
    }
  }
}
node {
  name: "b_nn_output1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_nn_output1"
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
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "b_nn_output1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_nn_output1"
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
  name: "b_nn_output1/Assign"
  op: "Assign"
  input: "b_nn_output1"
  input: "b_nn_output1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_nn_output1"
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
  name: "b_nn_output1/read"
  op: "Identity"
  input: "b_nn_output1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_nn_output1"
      }
    }
  }
}
node {
  name: "xw_plus_b/MatMul"
  op: "MatMul"
  input: "Sum_2"
  input: "w_nn_output1/read"
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
  input: "b_nn_output1/read"
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
  name: "concat_5/axis"
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
  name: "concat_5"
  op: "ConcatV2"
  input: "Mul"
  input: "mul_1"
  input: "Relu_2"
  input: "concat_5/axis"
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
  name: "final_w/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
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
        tensor_content: ";\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "final_w/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
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
        float_val: -0.3136250376701355
      }
    }
  }
}
node {
  name: "final_w/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
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
        float_val: 0.3136250376701355
      }
    }
  }
}
node {
  name: "final_w/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "final_w/Initializer/random_uniform/shape"
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
        s: "loc:@final_w"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "final_w/Initializer/random_uniform/sub"
  op: "Sub"
  input: "final_w/Initializer/random_uniform/max"
  input: "final_w/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
      }
    }
  }
}
node {
  name: "final_w/Initializer/random_uniform/mul"
  op: "Mul"
  input: "final_w/Initializer/random_uniform/RandomUniform"
  input: "final_w/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
      }
    }
  }
}
node {
  name: "final_w/Initializer/random_uniform"
  op: "Add"
  input: "final_w/Initializer/random_uniform/mul"
  input: "final_w/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
      }
    }
  }
}
node {
  name: "final_w"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
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
          size: 59
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
  name: "final_w/Assign"
  op: "Assign"
  input: "final_w"
  input: "final_w/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
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
  name: "final_w/read"
  op: "Identity"
  input: "final_w"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
      }
    }
  }
}
node {
  name: "final_b/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_b"
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
  name: "final_b"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_b"
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
  name: "final_b/Assign"
  op: "Assign"
  input: "final_b"
  input: "final_b/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_b"
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
  name: "final_b/read"
  op: "Identity"
  input: "final_b"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_b"
      }
    }
  }
}
node {
  name: "MatMul_6"
  op: "MatMul"
  input: "concat_5"
  input: "final_w/read"
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
  name: "Add_3"
  op: "Add"
  input: "MatMul_6"
  input: "final_b/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Softmax"
  op: "Softmax"
  input: "Add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "softmax_cross_entropy_with_logits_sg/labels_stop_gradient"
  op: "StopGradient"
  input: "Placeholder"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
}
node {
  name: "softmax_cross_entropy_with_logits_sg/Cast"
  op: "Cast"
  input: "softmax_cross_entropy_with_logits_sg/labels_stop_gradient"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT8
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
  name: "softmax_cross_entropy_with_logits_sg/Rank"
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
  name: "softmax_cross_entropy_with_logits_sg/Shape"
  op: "Shape"
  input: "Add_3"
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
  name: "softmax_cross_entropy_with_logits_sg/Rank_1"
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
  name: "softmax_cross_entropy_with_logits_sg/Shape_1"
  op: "Shape"
  input: "Add_3"
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
  name: "softmax_cross_entropy_with_logits_sg/Sub/y"
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
  name: "softmax_cross_entropy_with_logits_sg/Sub"
  op: "Sub"
  input: "softmax_cross_entropy_with_logits_sg/Rank_1"
  input: "softmax_cross_entropy_with_logits_sg/Sub/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "softmax_cross_entropy_with_logits_sg/Slice/begin"
  op: "Pack"
  input: "softmax_cross_entropy_with_logits_sg/Sub"
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
  name: "softmax_cross_entropy_with_logits_sg/Slice/size"
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
  name: "softmax_cross_entropy_with_logits_sg/Slice"
  op: "Slice"
  input: "softmax_cross_entropy_with_logits_sg/Shape_1"
  input: "softmax_cross_entropy_with_logits_sg/Slice/begin"
  input: "softmax_cross_entropy_with_logits_sg/Slice/size"
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
  name: "softmax_cross_entropy_with_logits_sg/concat/values_0"
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
  name: "softmax_cross_entropy_with_logits_sg/concat/axis"
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
  name: "softmax_cross_entropy_with_logits_sg/concat"
  op: "ConcatV2"
  input: "softmax_cross_entropy_with_logits_sg/concat/values_0"
  input: "softmax_cross_entropy_with_logits_sg/Slice"
  input: "softmax_cross_entropy_with_logits_sg/concat/axis"
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
  name: "softmax_cross_entropy_with_logits_sg/Reshape"
  op: "Reshape"
  input: "Add_3"
  input: "softmax_cross_entropy_with_logits_sg/concat"
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
  name: "softmax_cross_entropy_with_logits_sg/Rank_2"
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
  name: "softmax_cross_entropy_with_logits_sg/Shape_2"
  op: "Shape"
  input: "softmax_cross_entropy_with_logits_sg/Cast"
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
  name: "softmax_cross_entropy_with_logits_sg/Sub_1/y"
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
  name: "softmax_cross_entropy_with_logits_sg/Sub_1"
  op: "Sub"
  input: "softmax_cross_entropy_with_logits_sg/Rank_2"
  input: "softmax_cross_entropy_with_logits_sg/Sub_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "softmax_cross_entropy_with_logits_sg/Slice_1/begin"
  op: "Pack"
  input: "softmax_cross_entropy_with_logits_sg/Sub_1"
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
  name: "softmax_cross_entropy_with_logits_sg/Slice_1/size"
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
  name: "softmax_cross_entropy_with_logits_sg/Slice_1"
  op: "Slice"
  input: "softmax_cross_entropy_with_logits_sg/Shape_2"
  input: "softmax_cross_entropy_with_logits_sg/Slice_1/begin"
  input: "softmax_cross_entropy_with_logits_sg/Slice_1/size"
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
  name: "softmax_cross_entropy_with_logits_sg/concat_1/values_0"
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
  name: "softmax_cross_entropy_with_logits_sg/concat_1/axis"
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
  name: "softmax_cross_entropy_with_logits_sg/concat_1"
  op: "ConcatV2"
  input: "softmax_cross_entropy_with_logits_sg/concat_1/values_0"
  input: "softmax_cross_entropy_with_logits_sg/Slice_1"
  input: "softmax_cross_entropy_with_logits_sg/concat_1/axis"
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
  name: "softmax_cross_entropy_with_logits_sg/Reshape_1"
  op: "Reshape"
  input: "softmax_cross_entropy_with_logits_sg/Cast"
  input: "softmax_cross_entropy_with_logits_sg/concat_1"
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
  name: "softmax_cross_entropy_with_logits_sg"
  op: "SoftmaxCrossEntropyWithLogits"
  input: "softmax_cross_entropy_with_logits_sg/Reshape"
  input: "softmax_cross_entropy_with_logits_sg/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "softmax_cross_entropy_with_logits_sg/Sub_2/y"
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
  name: "softmax_cross_entropy_with_logits_sg/Sub_2"
  op: "Sub"
  input: "softmax_cross_entropy_with_logits_sg/Rank"
  input: "softmax_cross_entropy_with_logits_sg/Sub_2/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "softmax_cross_entropy_with_logits_sg/Slice_2/begin"
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
  name: "softmax_cross_entropy_with_logits_sg/Slice_2/size"
  op: "Pack"
  input: "softmax_cross_entropy_with_logits_sg/Sub_2"
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
  name: "softmax_cross_entropy_with_logits_sg/Slice_2"
  op: "Slice"
  input: "softmax_cross_entropy_with_logits_sg/Shape"
  input: "softmax_cross_entropy_with_logits_sg/Slice_2/begin"
  input: "softmax_cross_entropy_with_logits_sg/Slice_2/size"
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
  name: "softmax_cross_entropy_with_logits_sg/Reshape_2"
  op: "Reshape"
  input: "softmax_cross_entropy_with_logits_sg"
  input: "softmax_cross_entropy_with_logits_sg/Slice_2"
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
  name: "Const_6"
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
  name: "Mean"
  op: "Mean"
  input: "softmax_cross_entropy_with_logits_sg/Reshape_2"
  input: "Const_6"
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
  name: "gradients/Mean_grad/Reshape/shape"
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
  name: "gradients/Mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/Fill"
  input: "gradients/Mean_grad/Reshape/shape"
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
  name: "gradients/Mean_grad/Shape"
  op: "Shape"
  input: "softmax_cross_entropy_with_logits_sg/Reshape_2"
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
  name: "gradients/Mean_grad/Tile"
  op: "Tile"
  input: "gradients/Mean_grad/Reshape"
  input: "gradients/Mean_grad/Shape"
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
  name: "gradients/Mean_grad/Shape_1"
  op: "Shape"
  input: "softmax_cross_entropy_with_logits_sg/Reshape_2"
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
  name: "gradients/Mean_grad/Shape_2"
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
  name: "gradients/Mean_grad/Const"
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
  name: "gradients/Mean_grad/Prod"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_1"
  input: "gradients/Mean_grad/Const"
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
  name: "gradients/Mean_grad/Const_1"
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
  name: "gradients/Mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_2"
  input: "gradients/Mean_grad/Const_1"
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
  name: "gradients/Mean_grad/Maximum/y"
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
  name: "gradients/Mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/Mean_grad/Prod_1"
  input: "gradients/Mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/Mean_grad/Prod"
  input: "gradients/Mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Cast"
  op: "Cast"
  input: "gradients/Mean_grad/floordiv"
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
  name: "gradients/Mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/Mean_grad/Tile"
  input: "gradients/Mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Shape"
  op: "Shape"
  input: "softmax_cross_entropy_with_logits_sg"
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
  name: "gradients/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/Mean_grad/truediv"
  input: "gradients/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Shape"
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
  name: "gradients/zeros_like"
  op: "ZerosLike"
  input: "softmax_cross_entropy_with_logits_sg:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims/dim"
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
  name: "gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims"
  op: "ExpandDims"
  input: "gradients/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Reshape"
  input: "gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims/dim"
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
  name: "gradients/softmax_cross_entropy_with_logits_sg_grad/mul"
  op: "Mul"
  input: "gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims"
  input: "softmax_cross_entropy_with_logits_sg:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/softmax_cross_entropy_with_logits_sg_grad/LogSoftmax"
  op: "LogSoftmax"
  input: "softmax_cross_entropy_with_logits_sg/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/softmax_cross_entropy_with_logits_sg_grad/Neg"
  op: "Neg"
  input: "gradients/softmax_cross_entropy_with_logits_sg_grad/LogSoftmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1/dim"
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
  name: "gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1"
  op: "ExpandDims"
  input: "gradients/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Reshape"
  input: "gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1/dim"
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
  name: "gradients/softmax_cross_entropy_with_logits_sg_grad/mul_1"
  op: "Mul"
  input: "gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1"
  input: "gradients/softmax_cross_entropy_with_logits_sg_grad/Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/softmax_cross_entropy_with_logits_sg_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/softmax_cross_entropy_with_logits_sg_grad/mul"
  input: "^gradients/softmax_cross_entropy_with_logits_sg_grad/mul_1"
}
node {
  name: "gradients/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/softmax_cross_entropy_with_logits_sg_grad/mul"
  input: "^gradients/softmax_cross_entropy_with_logits_sg_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/softmax_cross_entropy_with_logits_sg_grad/mul"
      }
    }
  }
}
node {
  name: "gradients/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/softmax_cross_entropy_with_logits_sg_grad/mul_1"
  input: "^gradients/softmax_cross_entropy_with_logits_sg_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/softmax_cross_entropy_with_logits_sg_grad/mul_1"
      }
    }
  }
}
node {
  name: "gradients/softmax_cross_entropy_with_logits_sg/Reshape_grad/Shape"
  op: "Shape"
  input: "Add_3"
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
  name: "gradients/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependency"
  input: "gradients/softmax_cross_entropy_with_logits_sg/Reshape_grad/Shape"
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
  name: "gradients/Add_3_grad/Shape"
  op: "Shape"
  input: "MatMul_6"
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
  name: "gradients/Add_3_grad/Shape_1"
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
  name: "gradients/Add_3_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Add_3_grad/Shape"
  input: "gradients/Add_3_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_3_grad/Sum"
  op: "Sum"
  input: "gradients/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape"
  input: "gradients/Add_3_grad/BroadcastGradientArgs"
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
  name: "gradients/Add_3_grad/Reshape"
  op: "Reshape"
  input: "gradients/Add_3_grad/Sum"
  input: "gradients/Add_3_grad/Shape"
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
  name: "gradients/Add_3_grad/Sum_1"
  op: "Sum"
  input: "gradients/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape"
  input: "gradients/Add_3_grad/BroadcastGradientArgs:1"
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
  name: "gradients/Add_3_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Add_3_grad/Sum_1"
  input: "gradients/Add_3_grad/Shape_1"
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
  name: "gradients/Add_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Add_3_grad/Reshape"
  input: "^gradients/Add_3_grad/Reshape_1"
}
node {
  name: "gradients/Add_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Add_3_grad/Reshape"
  input: "^gradients/Add_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_3_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Add_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Add_3_grad/Reshape_1"
  input: "^gradients/Add_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_3_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_6_grad/MatMul"
  op: "MatMul"
  input: "gradients/Add_3_grad/tuple/control_dependency"
  input: "final_w/read"
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
  input: "concat_5"
  input: "gradients/Add_3_grad/tuple/control_dependency"
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
  name: "gradients/concat_5_grad/Rank"
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
  name: "gradients/concat_5_grad/mod"
  op: "FloorMod"
  input: "concat_5/axis"
  input: "gradients/concat_5_grad/Rank"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/concat_5_grad/Shape"
  op: "Shape"
  input: "Mul"
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
  name: "gradients/concat_5_grad/ShapeN"
  op: "ShapeN"
  input: "Mul"
  input: "mul_1"
  input: "Relu_2"
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
  name: "gradients/concat_5_grad/ConcatOffset"
  op: "ConcatOffset"
  input: "gradients/concat_5_grad/mod"
  input: "gradients/concat_5_grad/ShapeN"
  input: "gradients/concat_5_grad/ShapeN:1"
  input: "gradients/concat_5_grad/ShapeN:2"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
}
node {
  name: "gradients/concat_5_grad/Slice"
  op: "Slice"
  input: "gradients/MatMul_6_grad/tuple/control_dependency"
  input: "gradients/concat_5_grad/ConcatOffset"
  input: "gradients/concat_5_grad/ShapeN"
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
  name: "gradients/concat_5_grad/Slice_1"
  op: "Slice"
  input: "gradients/MatMul_6_grad/tuple/control_dependency"
  input: "gradients/concat_5_grad/ConcatOffset:1"
  input: "gradients/concat_5_grad/ShapeN:1"
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
  name: "gradients/concat_5_grad/Slice_2"
  op: "Slice"
  input: "gradients/MatMul_6_grad/tuple/control_dependency"
  input: "gradients/concat_5_grad/ConcatOffset:2"
  input: "gradients/concat_5_grad/ShapeN:2"
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
  name: "gradients/concat_5_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/concat_5_grad/Slice"
  input: "^gradients/concat_5_grad/Slice_1"
  input: "^gradients/concat_5_grad/Slice_2"
}
node {
  name: "gradients/concat_5_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/concat_5_grad/Slice"
  input: "^gradients/concat_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_5_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/concat_5_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/concat_5_grad/Slice_1"
  input: "^gradients/concat_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_5_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/concat_5_grad/tuple/control_dependency_2"
  op: "Identity"
  input: "gradients/concat_5_grad/Slice_2"
  input: "^gradients/concat_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/concat_5_grad/Slice_2"
      }
    }
  }
}
node {
  name: "gradients/Mul_grad/Shape"
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
  name: "gradients/Mul_grad/Shape_1"
  op: "Shape"
  input: "Placeholder_1"
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
  name: "gradients/Mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Mul_grad/Shape"
  input: "gradients/Mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_grad/Mul"
  op: "Mul"
  input: "gradients/concat_5_grad/tuple/control_dependency"
  input: "Placeholder_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_grad/Sum"
  op: "Sum"
  input: "gradients/Mul_grad/Mul"
  input: "gradients/Mul_grad/BroadcastGradientArgs"
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
  name: "gradients/Mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/Mul_grad/Sum"
  input: "gradients/Mul_grad/Shape"
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
  name: "gradients/Mul_grad/Mul_1"
  op: "Mul"
  input: "concat"
  input: "gradients/concat_5_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/Mul_grad/Mul_1"
  input: "gradients/Mul_grad/BroadcastGradientArgs:1"
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
  name: "gradients/Mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Mul_grad/Sum_1"
  input: "gradients/Mul_grad/Shape_1"
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
  name: "gradients/Mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Mul_grad/Reshape"
  input: "^gradients/Mul_grad/Reshape_1"
}
node {
  name: "gradients/Mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Mul_grad/Reshape"
  input: "^gradients/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Mul_grad/Reshape_1"
  input: "^gradients/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mul_1_grad/Shape"
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
  name: "gradients/mul_1_grad/Shape_1"
  op: "Shape"
  input: "Sub"
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
  input: "gradients/concat_5_grad/tuple/control_dependency_1"
  input: "Sub"
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
  input: "mul_1/x"
  input: "gradients/concat_5_grad/tuple/control_dependency_1"
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
  name: "gradients/Relu_2_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/concat_5_grad/tuple/control_dependency_2"
  input: "Relu_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        int_val: 2
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
  name: "gradients/concat_grad/ShapeN"
  op: "ShapeN"
  input: "Reshape"
  input: "Reshape_1"
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
  name: "gradients/concat_grad/ConcatOffset"
  op: "ConcatOffset"
  input: "gradients/concat_grad/mod"
  input: "gradients/concat_grad/ShapeN"
  input: "gradients/concat_grad/ShapeN:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
}
node {
  name: "gradients/concat_grad/Slice"
  op: "Slice"
  input: "gradients/Mul_grad/tuple/control_dependency"
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
  input: "gradients/Mul_grad/tuple/control_dependency"
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
  name: "gradients/concat_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/concat_grad/Slice"
  input: "^gradients/concat_grad/Slice_1"
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
  name: "gradients/Sub_grad/Shape"
  op: "Shape"
  input: "Square"
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
  name: "gradients/Sub_grad/Shape_1"
  op: "Shape"
  input: "Sum_1"
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
  name: "gradients/Sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Sub_grad/Shape"
  input: "gradients/Sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sub_grad/Sum"
  op: "Sum"
  input: "gradients/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/Sub_grad/BroadcastGradientArgs"
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
  name: "gradients/Sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/Sub_grad/Sum"
  input: "gradients/Sub_grad/Shape"
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
  name: "gradients/Sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/Sub_grad/BroadcastGradientArgs:1"
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
  name: "gradients/Sub_grad/Neg"
  op: "Neg"
  input: "gradients/Sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Sub_grad/Neg"
  input: "gradients/Sub_grad/Shape_1"
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
  name: "gradients/Sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Sub_grad/Reshape"
  input: "^gradients/Sub_grad/Reshape_1"
}
node {
  name: "gradients/Sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Sub_grad/Reshape"
  input: "^gradients/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Sub_grad/Reshape_1"
  input: "^gradients/Sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/add_1_grad/Shape"
  op: "Shape"
  input: "batch_normalization_2/batchnorm/mul_1"
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
  name: "gradients/batch_normalization_2/batchnorm/add_1_grad/Shape_1"
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
        int_val: 32
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/Shape"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/Relu_2_grad/ReluGrad"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization_2/batchnorm/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/Sum"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/Shape"
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
  name: "gradients/batch_normalization_2/batchnorm/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/Relu_2_grad/ReluGrad"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization_2/batchnorm/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/Sum_1"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/Shape_1"
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
  name: "gradients/batch_normalization_2/batchnorm/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_2/batchnorm/add_1_grad/Reshape"
  input: "^gradients/batch_normalization_2/batchnorm/add_1_grad/Reshape_1"
}
node {
  name: "gradients/batch_normalization_2/batchnorm/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/Reshape"
  input: "^gradients/batch_normalization_2/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/Reshape_1"
  input: "^gradients/batch_normalization_2/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Reshape_grad/Shape"
  op: "Shape"
  input: "embedding_lookup/Identity"
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
  input: "gradients/concat_grad/tuple/control_dependency"
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
  input: "embedding_lookup_1/Identity"
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
  input: "gradients/concat_grad/tuple/control_dependency_1"
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
  name: "gradients/Square_grad/Const"
  op: "Const"
  input: "^gradients/Sub_grad/tuple/control_dependency"
  attr {
    key: "dtype"
    value {
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
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/Square_grad/Mul"
  op: "Mul"
  input: "Sum"
  input: "gradients/Square_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Square_grad/Mul_1"
  op: "Mul"
  input: "gradients/Sub_grad/tuple/control_dependency"
  input: "gradients/Square_grad/Mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Sum_1_grad/Shape"
  op: "Shape"
  input: "Square_1"
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
  input: "gradients/Sub_grad/tuple/control_dependency_1"
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
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Shape"
  op: "Shape"
  input: "Add_2"
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
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Shape_1"
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
        int_val: 32
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Shape"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/tuple/control_dependency"
  input: "batch_normalization_2/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Mul"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Sum"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Shape"
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
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Mul_1"
  op: "Mul"
  input: "Add_2"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Mul_1"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Sum_1"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Shape_1"
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
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_2/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/batch_normalization_2/batchnorm/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/batch_normalization_2/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/Reshape_1"
  input: "^gradients/batch_normalization_2/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/sub_grad/Neg"
  op: "Neg"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_2/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "^gradients/batch_normalization_2/batchnorm/sub_grad/Neg"
}
node {
  name: "gradients/batch_normalization_2/batchnorm/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "^gradients/batch_normalization_2/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/sub_grad/Neg"
  input: "^gradients/batch_normalization_2/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/sub_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/Shape"
  op: "Shape"
  input: "Reshape_4"
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
  input: "gradients/Square_grad/Mul_1"
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
  name: "gradients/Square_1_grad/Const"
  op: "Const"
  input: "^gradients/Sum_1_grad/Tile"
  attr {
    key: "dtype"
    value {
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
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/Square_1_grad/Mul"
  op: "Mul"
  input: "Reshape_4"
  input: "gradients/Square_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Square_1_grad/Mul_1"
  op: "Mul"
  input: "gradients/Sum_1_grad/Tile"
  input: "gradients/Square_1_grad/Mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_2_grad/Mul"
  op: "Mul"
  input: "gradients/batch_normalization_2/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "batch_normalization_2/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_2_grad/Mul_1"
  op: "Mul"
  input: "gradients/batch_normalization_2/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "batch_normalization_2/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_2/batchnorm/mul_2_grad/Mul"
  input: "^gradients/batch_normalization_2/batchnorm/mul_2_grad/Mul_1"
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/mul_2_grad/Mul"
  input: "^gradients/batch_normalization_2/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/mul_2_grad/Mul_1"
  input: "^gradients/batch_normalization_2/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/mul_2_grad/Mul_1"
      }
    }
  }
}
node {
  name: "gradients/embedding_lookup_grad/Shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
        tensor_content: "\020\'\000\000\000\000\000\000\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/embedding_lookup_grad/Cast"
  op: "Cast"
  input: "gradients/embedding_lookup_grad/Shape"
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
        s: "loc:@single_first_embedding"
      }
    }
  }
}
node {
  name: "gradients/embedding_lookup_grad/Size"
  op: "Size"
  input: "Placeholder_2"
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
  name: "gradients/embedding_lookup_grad/ExpandDims/dim"
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
  name: "gradients/embedding_lookup_grad/ExpandDims"
  op: "ExpandDims"
  input: "gradients/embedding_lookup_grad/Size"
  input: "gradients/embedding_lookup_grad/ExpandDims/dim"
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
  name: "gradients/embedding_lookup_grad/strided_slice/stack"
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
  name: "gradients/embedding_lookup_grad/strided_slice/stack_1"
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
  name: "gradients/embedding_lookup_grad/strided_slice/stack_2"
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
  name: "gradients/embedding_lookup_grad/strided_slice"
  op: "StridedSlice"
  input: "gradients/embedding_lookup_grad/Cast"
  input: "gradients/embedding_lookup_grad/strided_slice/stack"
  input: "gradients/embedding_lookup_grad/strided_slice/stack_1"
  input: "gradients/embedding_lookup_grad/strided_slice/stack_2"
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
  name: "gradients/embedding_lookup_grad/concat/axis"
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
  name: "gradients/embedding_lookup_grad/concat"
  op: "ConcatV2"
  input: "gradients/embedding_lookup_grad/ExpandDims"
  input: "gradients/embedding_lookup_grad/strided_slice"
  input: "gradients/embedding_lookup_grad/concat/axis"
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
  name: "gradients/embedding_lookup_grad/Reshape"
  op: "Reshape"
  input: "gradients/Reshape_grad/Reshape"
  input: "gradients/embedding_lookup_grad/concat"
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
  name: "gradients/embedding_lookup_grad/Reshape_1"
  op: "Reshape"
  input: "Placeholder_2"
  input: "gradients/embedding_lookup_grad/ExpandDims"
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
  name: "gradients/embedding_lookup_1_grad/Shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
        tensor_content: "\020\'\000\000\000\000\000\000\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/embedding_lookup_1_grad/Cast"
  op: "Cast"
  input: "gradients/embedding_lookup_1_grad/Shape"
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
        s: "loc:@numerical_first_embedding"
      }
    }
  }
}
node {
  name: "gradients/embedding_lookup_1_grad/Size"
  op: "Size"
  input: "Placeholder_3"
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
  name: "gradients/embedding_lookup_1_grad/ExpandDims/dim"
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
  name: "gradients/embedding_lookup_1_grad/ExpandDims"
  op: "ExpandDims"
  input: "gradients/embedding_lookup_1_grad/Size"
  input: "gradients/embedding_lookup_1_grad/ExpandDims/dim"
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
  name: "gradients/embedding_lookup_1_grad/strided_slice/stack"
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
  name: "gradients/embedding_lookup_1_grad/strided_slice/stack_1"
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
  name: "gradients/embedding_lookup_1_grad/strided_slice/stack_2"
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
  name: "gradients/embedding_lookup_1_grad/strided_slice"
  op: "StridedSlice"
  input: "gradients/embedding_lookup_1_grad/Cast"
  input: "gradients/embedding_lookup_1_grad/strided_slice/stack"
  input: "gradients/embedding_lookup_1_grad/strided_slice/stack_1"
  input: "gradients/embedding_lookup_1_grad/strided_slice/stack_2"
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
  name: "gradients/embedding_lookup_1_grad/concat/axis"
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
  name: "gradients/embedding_lookup_1_grad/concat"
  op: "ConcatV2"
  input: "gradients/embedding_lookup_1_grad/ExpandDims"
  input: "gradients/embedding_lookup_1_grad/strided_slice"
  input: "gradients/embedding_lookup_1_grad/concat/axis"
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
  name: "gradients/embedding_lookup_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/Reshape_1_grad/Reshape"
  input: "gradients/embedding_lookup_1_grad/concat"
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
  name: "gradients/embedding_lookup_1_grad/Reshape_1"
  op: "Reshape"
  input: "Placeholder_3"
  input: "gradients/embedding_lookup_1_grad/ExpandDims"
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
  name: "gradients/AddN"
  op: "AddN"
  input: "gradients/Sum_grad/Tile"
  input: "gradients/Square_1_grad/Mul_1"
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
        s: "loc:@gradients/Sum_grad/Tile"
      }
    }
  }
}
node {
  name: "gradients/Reshape_4_grad/Shape"
  op: "Shape"
  input: "concat_2"
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
  name: "gradients/Reshape_4_grad/Reshape"
  op: "Reshape"
  input: "gradients/AddN"
  input: "gradients/Reshape_4_grad/Shape"
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
  name: "gradients/batch_normalization_2/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/batch_normalization_2/batchnorm/mul_2_grad/tuple/control_dependency"
  input: "batch_normalization_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_2/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/batch_normalization_2/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_2/cond/Merge_grad/cond_grad"
  input: "^gradients/batch_normalization_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_2/cond/Merge_grad/cond_grad:1"
  input: "^gradients/batch_normalization_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/AddN_1"
  op: "AddN"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/batch_normalization_2/batchnorm/mul_2_grad/tuple/control_dependency_1"
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
        s: "loc:@gradients/batch_normalization_2/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_grad/Mul"
  op: "Mul"
  input: "gradients/AddN_1"
  input: "batch_normalization_2/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_grad/Mul_1"
  op: "Mul"
  input: "gradients/AddN_1"
  input: "batch_normalization_2/batchnorm/Rsqrt"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_2/batchnorm/mul_grad/Mul"
  input: "^gradients/batch_normalization_2/batchnorm/mul_grad/Mul_1"
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/mul_grad/Mul"
  input: "^gradients/batch_normalization_2/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/mul_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/mul_grad/Mul_1"
  input: "^gradients/batch_normalization_2/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/mul_grad/Mul_1"
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
  name: "gradients/concat_2_grad/ShapeN"
  op: "ShapeN"
  input: "concat_1"
  input: "Reshape_3"
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
  input: "gradients/Reshape_4_grad/Reshape"
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
  input: "gradients/Reshape_4_grad/Reshape"
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
  name: "gradients/Switch"
  op: "Switch"
  input: "batch_normalization_2/moments/Squeeze"
  input: "batch_normalization_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity"
  op: "Identity"
  input: "gradients/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_1"
  op: "Shape"
  input: "gradients/Switch"
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
  name: "gradients/zeros/Const"
  op: "Const"
  input: "^gradients/Identity"
  attr {
    key: "dtype"
    value {
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
  name: "gradients/zeros"
  op: "Fill"
  input: "gradients/Shape_1"
  input: "gradients/zeros/Const"
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
  name: "gradients/batch_normalization_2/cond/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/zeros"
  input: "gradients/batch_normalization_2/cond/Merge_grad/tuple/control_dependency_1"
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
}
node {
  name: "gradients/batch_normalization_2/batchnorm/Rsqrt_grad/RsqrtGrad"
  op: "RsqrtGrad"
  input: "batch_normalization_2/batchnorm/Rsqrt"
  input: "gradients/batch_normalization_2/batchnorm/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Reshape_3_grad/Shape"
  op: "Shape"
  input: "embedding_lookup_3/Identity"
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
  name: "gradients/Reshape_3_grad/Reshape"
  op: "Reshape"
  input: "gradients/concat_2_grad/tuple/control_dependency_1"
  input: "gradients/Reshape_3_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/Squeeze_grad/Shape"
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
        tensor_content: "\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/Squeeze_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_2/cond/Switch_1_grad/cond_grad"
  input: "gradients/batch_normalization_2/moments/Squeeze_grad/Shape"
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
  name: "gradients/batch_normalization_2/batchnorm/add_grad/Shape"
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
        int_val: 32
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/add_grad/Shape_1"
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
  name: "gradients/batch_normalization_2/batchnorm/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization_2/batchnorm/add_grad/Shape"
  input: "gradients/batch_normalization_2/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/add_grad/Sum"
  op: "Sum"
  input: "gradients/batch_normalization_2/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/batch_normalization_2/batchnorm/add_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization_2/batchnorm/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_2/batchnorm/add_grad/Sum"
  input: "gradients/batch_normalization_2/batchnorm/add_grad/Shape"
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
  name: "gradients/batch_normalization_2/batchnorm/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/batch_normalization_2/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/batch_normalization_2/batchnorm/add_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization_2/batchnorm/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization_2/batchnorm/add_grad/Sum_1"
  input: "gradients/batch_normalization_2/batchnorm/add_grad/Shape_1"
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
  name: "gradients/batch_normalization_2/batchnorm/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_2/batchnorm/add_grad/Reshape"
  input: "^gradients/batch_normalization_2/batchnorm/add_grad/Reshape_1"
}
node {
  name: "gradients/batch_normalization_2/batchnorm/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/add_grad/Reshape"
  input: "^gradients/batch_normalization_2/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/batchnorm/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_2/batchnorm/add_grad/Reshape_1"
  input: "^gradients/batch_normalization_2/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/cond_1/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/batch_normalization_2/batchnorm/add_grad/tuple/control_dependency"
  input: "batch_normalization_2/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/cond_1/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_2/cond_1/Merge_grad/cond_grad"
}
node {
  name: "gradients/batch_normalization_2/cond_1/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_2/cond_1/Merge_grad/cond_grad"
  input: "^gradients/batch_normalization_2/cond_1/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/cond_1/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_2/cond_1/Merge_grad/cond_grad:1"
  input: "^gradients/batch_normalization_2/cond_1/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/embedding_lookup_3_grad/Shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
        tensor_content: "\020\'\000\000\000\000\000\000\020\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/embedding_lookup_3_grad/Cast"
  op: "Cast"
  input: "gradients/embedding_lookup_3_grad/Shape"
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
        s: "loc:@numerical_second_embedding"
      }
    }
  }
}
node {
  name: "gradients/embedding_lookup_3_grad/Size"
  op: "Size"
  input: "Placeholder_3"
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
  name: "gradients/embedding_lookup_3_grad/ExpandDims/dim"
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
  name: "gradients/embedding_lookup_3_grad/ExpandDims"
  op: "ExpandDims"
  input: "gradients/embedding_lookup_3_grad/Size"
  input: "gradients/embedding_lookup_3_grad/ExpandDims/dim"
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
  name: "gradients/embedding_lookup_3_grad/strided_slice/stack"
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
  name: "gradients/embedding_lookup_3_grad/strided_slice/stack_1"
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
  name: "gradients/embedding_lookup_3_grad/strided_slice/stack_2"
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
  name: "gradients/embedding_lookup_3_grad/strided_slice"
  op: "StridedSlice"
  input: "gradients/embedding_lookup_3_grad/Cast"
  input: "gradients/embedding_lookup_3_grad/strided_slice/stack"
  input: "gradients/embedding_lookup_3_grad/strided_slice/stack_1"
  input: "gradients/embedding_lookup_3_grad/strided_slice/stack_2"
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
  name: "gradients/embedding_lookup_3_grad/concat/axis"
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
  name: "gradients/embedding_lookup_3_grad/concat"
  op: "ConcatV2"
  input: "gradients/embedding_lookup_3_grad/ExpandDims"
  input: "gradients/embedding_lookup_3_grad/strided_slice"
  input: "gradients/embedding_lookup_3_grad/concat/axis"
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
  name: "gradients/embedding_lookup_3_grad/Reshape"
  op: "Reshape"
  input: "gradients/Reshape_3_grad/Reshape"
  input: "gradients/embedding_lookup_3_grad/concat"
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
  name: "gradients/embedding_lookup_3_grad/Reshape_1"
  op: "Reshape"
  input: "Placeholder_3"
  input: "gradients/embedding_lookup_3_grad/ExpandDims"
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
  name: "gradients/Switch_1"
  op: "Switch"
  input: "batch_normalization_2/moments/Squeeze_1"
  input: "batch_normalization_2/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_1"
  op: "Identity"
  input: "gradients/Switch_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_2"
  op: "Shape"
  input: "gradients/Switch_1"
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
  name: "gradients/zeros_1/Const"
  op: "Const"
  input: "^gradients/Identity_1"
  attr {
    key: "dtype"
    value {
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
  name: "gradients/zeros_1"
  op: "Fill"
  input: "gradients/Shape_2"
  input: "gradients/zeros_1/Const"
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
  name: "gradients/batch_normalization_2/cond_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/zeros_1"
  input: "gradients/batch_normalization_2/cond_1/Merge_grad/tuple/control_dependency_1"
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
}
node {
  name: "gradients/batch_normalization_2/moments/Squeeze_1_grad/Shape"
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
        tensor_content: "\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/Squeeze_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_2/cond_1/Switch_1_grad/cond_grad"
  input: "gradients/batch_normalization_2/moments/Squeeze_1_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Shape"
  op: "Shape"
  input: "batch_normalization_2/moments/SquaredDifference"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
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
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/variance_grad/add"
  op: "Add"
  input: "batch_normalization_2/moments/variance/reduction_indices"
  input: "gradients/batch_normalization_2/moments/variance_grad/Size"
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
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/variance_grad/mod"
  op: "FloorMod"
  input: "gradients/batch_normalization_2/moments/variance_grad/add"
  input: "gradients/batch_normalization_2/moments/variance_grad/Size"
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
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/variance_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/range"
  op: "Range"
  input: "gradients/batch_normalization_2/moments/variance_grad/range/start"
  input: "gradients/batch_normalization_2/moments/variance_grad/Size"
  input: "gradients/batch_normalization_2/moments/variance_grad/range/delta"
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
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/variance_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Fill"
  op: "Fill"
  input: "gradients/batch_normalization_2/moments/variance_grad/Shape_1"
  input: "gradients/batch_normalization_2/moments/variance_grad/Fill/value"
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
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/batch_normalization_2/moments/variance_grad/range"
  input: "gradients/batch_normalization_2/moments/variance_grad/mod"
  input: "gradients/batch_normalization_2/moments/variance_grad/Shape"
  input: "gradients/batch_normalization_2/moments/variance_grad/Fill"
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
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/variance_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Maximum"
  op: "Maximum"
  input: "gradients/batch_normalization_2/moments/variance_grad/DynamicStitch"
  input: "gradients/batch_normalization_2/moments/variance_grad/Maximum/y"
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
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/variance_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/batch_normalization_2/moments/variance_grad/Shape"
  input: "gradients/batch_normalization_2/moments/variance_grad/Maximum"
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
        s: "loc:@gradients/batch_normalization_2/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/variance_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_2/moments/Squeeze_1_grad/Reshape"
  input: "gradients/batch_normalization_2/moments/variance_grad/DynamicStitch"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Tile"
  op: "Tile"
  input: "gradients/batch_normalization_2/moments/variance_grad/Reshape"
  input: "gradients/batch_normalization_2/moments/variance_grad/floordiv"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Shape_2"
  op: "Shape"
  input: "batch_normalization_2/moments/SquaredDifference"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Shape_3"
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
        tensor_content: "\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/variance_grad/Const"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Prod"
  op: "Prod"
  input: "gradients/batch_normalization_2/moments/variance_grad/Shape_2"
  input: "gradients/batch_normalization_2/moments/variance_grad/Const"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Const_1"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Prod_1"
  op: "Prod"
  input: "gradients/batch_normalization_2/moments/variance_grad/Shape_3"
  input: "gradients/batch_normalization_2/moments/variance_grad/Const_1"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Maximum_1/y"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/batch_normalization_2/moments/variance_grad/Prod_1"
  input: "gradients/batch_normalization_2/moments/variance_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/variance_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/batch_normalization_2/moments/variance_grad/Prod"
  input: "gradients/batch_normalization_2/moments/variance_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/variance_grad/Cast"
  op: "Cast"
  input: "gradients/batch_normalization_2/moments/variance_grad/floordiv_1"
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
  name: "gradients/batch_normalization_2/moments/variance_grad/truediv"
  op: "RealDiv"
  input: "gradients/batch_normalization_2/moments/variance_grad/Tile"
  input: "gradients/batch_normalization_2/moments/variance_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Shape"
  op: "Shape"
  input: "Add_2"
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
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Shape_1"
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
        tensor_content: "\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Shape"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/batch_normalization_2/moments/variance_grad/truediv"
  attr {
    key: "dtype"
    value {
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
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Mul"
  op: "Mul"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/scalar"
  input: "gradients/batch_normalization_2/moments/variance_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/sub"
  op: "Sub"
  input: "Add_2"
  input: "batch_normalization_2/moments/StopGradient"
  input: "^gradients/batch_normalization_2/moments/variance_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Mul"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/mul_1"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Sum"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/mul_1"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Sum_1"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Shape_1"
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
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_2/moments/SquaredDifference_grad/Neg"
  input: "^gradients/batch_normalization_2/moments/SquaredDifference_grad/Reshape"
}
node {
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/batch_normalization_2/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/Neg"
  input: "^gradients/batch_normalization_2/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/mean_grad/Shape"
  op: "Shape"
  input: "Add_2"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
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
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/mean_grad/add"
  op: "Add"
  input: "batch_normalization_2/moments/mean/reduction_indices"
  input: "gradients/batch_normalization_2/moments/mean_grad/Size"
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
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/mean_grad/mod"
  op: "FloorMod"
  input: "gradients/batch_normalization_2/moments/mean_grad/add"
  input: "gradients/batch_normalization_2/moments/mean_grad/Size"
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
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/range"
  op: "Range"
  input: "gradients/batch_normalization_2/moments/mean_grad/range/start"
  input: "gradients/batch_normalization_2/moments/mean_grad/Size"
  input: "gradients/batch_normalization_2/moments/mean_grad/range/delta"
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
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/Fill"
  op: "Fill"
  input: "gradients/batch_normalization_2/moments/mean_grad/Shape_1"
  input: "gradients/batch_normalization_2/moments/mean_grad/Fill/value"
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
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/batch_normalization_2/moments/mean_grad/range"
  input: "gradients/batch_normalization_2/moments/mean_grad/mod"
  input: "gradients/batch_normalization_2/moments/mean_grad/Shape"
  input: "gradients/batch_normalization_2/moments/mean_grad/Fill"
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
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/batch_normalization_2/moments/mean_grad/DynamicStitch"
  input: "gradients/batch_normalization_2/moments/mean_grad/Maximum/y"
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
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/batch_normalization_2/moments/mean_grad/Shape"
  input: "gradients/batch_normalization_2/moments/mean_grad/Maximum"
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
        s: "loc:@gradients/batch_normalization_2/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_2/moments/Squeeze_grad/Reshape"
  input: "gradients/batch_normalization_2/moments/mean_grad/DynamicStitch"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/Tile"
  op: "Tile"
  input: "gradients/batch_normalization_2/moments/mean_grad/Reshape"
  input: "gradients/batch_normalization_2/moments/mean_grad/floordiv"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/Shape_2"
  op: "Shape"
  input: "Add_2"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/Shape_3"
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
        tensor_content: "\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/mean_grad/Const"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/Prod"
  op: "Prod"
  input: "gradients/batch_normalization_2/moments/mean_grad/Shape_2"
  input: "gradients/batch_normalization_2/moments/mean_grad/Const"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/Const_1"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/batch_normalization_2/moments/mean_grad/Shape_3"
  input: "gradients/batch_normalization_2/moments/mean_grad/Const_1"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/Maximum_1/y"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/batch_normalization_2/moments/mean_grad/Prod_1"
  input: "gradients/batch_normalization_2/moments/mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/batch_normalization_2/moments/mean_grad/Prod"
  input: "gradients/batch_normalization_2/moments/mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_2/moments/mean_grad/Cast"
  op: "Cast"
  input: "gradients/batch_normalization_2/moments/mean_grad/floordiv_1"
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
  name: "gradients/batch_normalization_2/moments/mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/batch_normalization_2/moments/mean_grad/Tile"
  input: "gradients/batch_normalization_2/moments/mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_2"
  op: "AddN"
  input: "gradients/batch_normalization_2/batchnorm/mul_1_grad/tuple/control_dependency"
  input: "gradients/batch_normalization_2/moments/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/batch_normalization_2/moments/mean_grad/truediv"
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
        s: "loc:@gradients/batch_normalization_2/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Add_2_grad/Shape"
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
  name: "gradients/Add_2_grad/Shape_1"
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
        int_val: 32
      }
    }
  }
}
node {
  name: "gradients/Add_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Add_2_grad/Shape"
  input: "gradients/Add_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_2_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_2"
  input: "gradients/Add_2_grad/BroadcastGradientArgs"
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
  name: "gradients/Add_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/Add_2_grad/Sum"
  input: "gradients/Add_2_grad/Shape"
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
  name: "gradients/Add_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_2"
  input: "gradients/Add_2_grad/BroadcastGradientArgs:1"
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
  name: "gradients/Add_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Add_2_grad/Sum_1"
  input: "gradients/Add_2_grad/Shape_1"
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
  name: "gradients/Add_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Add_2_grad/Reshape"
  input: "^gradients/Add_2_grad/Reshape_1"
}
node {
  name: "gradients/Add_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Add_2_grad/Reshape"
  input: "^gradients/Add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Add_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Add_2_grad/Reshape_1"
  input: "^gradients/Add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_2_grad/MatMul"
  op: "MatMul"
  input: "gradients/Add_2_grad/tuple/control_dependency"
  input: "W_2/read"
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
  input: "batch_normalization_1/batchnorm/add_1"
  input: "gradients/Add_2_grad/tuple/control_dependency"
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
  name: "gradients/batch_normalization_1/batchnorm/add_1_grad/Shape"
  op: "Shape"
  input: "batch_normalization_1/batchnorm/mul_1"
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
  name: "gradients/batch_normalization_1/batchnorm/add_1_grad/Shape_1"
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
        int_val: 64
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/Shape"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/MatMul_2_grad/tuple/control_dependency"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/Sum"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/Shape"
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
  name: "gradients/batch_normalization_1/batchnorm/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/MatMul_2_grad/tuple/control_dependency"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/Sum_1"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/Shape_1"
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
  name: "gradients/batch_normalization_1/batchnorm/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape"
  input: "^gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape_1"
}
node {
  name: "gradients/batch_normalization_1/batchnorm/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape"
  input: "^gradients/batch_normalization_1/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape_1"
  input: "^gradients/batch_normalization_1/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Shape"
  op: "Shape"
  input: "Add_1"
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
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Shape_1"
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
        int_val: 64
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Shape"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/tuple/control_dependency"
  input: "batch_normalization_1/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Mul"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Sum"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Shape"
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
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Mul_1"
  op: "Mul"
  input: "Add_1"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Mul_1"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Sum_1"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Shape_1"
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
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/batch_normalization_1/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape_1"
  input: "^gradients/batch_normalization_1/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/sub_grad/Neg"
  op: "Neg"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_1/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "^gradients/batch_normalization_1/batchnorm/sub_grad/Neg"
}
node {
  name: "gradients/batch_normalization_1/batchnorm/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "^gradients/batch_normalization_1/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/sub_grad/Neg"
  input: "^gradients/batch_normalization_1/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/sub_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul"
  op: "Mul"
  input: "gradients/batch_normalization_1/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "batch_normalization_1/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul_1"
  op: "Mul"
  input: "gradients/batch_normalization_1/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "batch_normalization_1/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul"
  input: "^gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul_1"
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul"
  input: "^gradients/batch_normalization_1/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul_1"
  input: "^gradients/batch_normalization_1/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/batch_normalization_1/batchnorm/mul_2_grad/tuple/control_dependency"
  input: "batch_normalization_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_1/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/batch_normalization_1/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_1/cond/Merge_grad/cond_grad"
  input: "^gradients/batch_normalization_1/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_1/cond/Merge_grad/cond_grad:1"
  input: "^gradients/batch_normalization_1/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/AddN_3"
  op: "AddN"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/batch_normalization_1/batchnorm/mul_2_grad/tuple/control_dependency_1"
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
        s: "loc:@gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_grad/Mul"
  op: "Mul"
  input: "gradients/AddN_3"
  input: "batch_normalization_1/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_grad/Mul_1"
  op: "Mul"
  input: "gradients/AddN_3"
  input: "batch_normalization_1/batchnorm/Rsqrt"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_1/batchnorm/mul_grad/Mul"
  input: "^gradients/batch_normalization_1/batchnorm/mul_grad/Mul_1"
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/mul_grad/Mul"
  input: "^gradients/batch_normalization_1/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/mul_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/mul_grad/Mul_1"
  input: "^gradients/batch_normalization_1/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/mul_grad/Mul_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_2"
  op: "Switch"
  input: "batch_normalization_1/moments/Squeeze"
  input: "batch_normalization_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_2"
  op: "Identity"
  input: "gradients/Switch_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_3"
  op: "Shape"
  input: "gradients/Switch_2"
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
  name: "gradients/zeros_2/Const"
  op: "Const"
  input: "^gradients/Identity_2"
  attr {
    key: "dtype"
    value {
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
  name: "gradients/zeros_2"
  op: "Fill"
  input: "gradients/Shape_3"
  input: "gradients/zeros_2/Const"
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
  name: "gradients/batch_normalization_1/cond/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/zeros_2"
  input: "gradients/batch_normalization_1/cond/Merge_grad/tuple/control_dependency_1"
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
}
node {
  name: "gradients/batch_normalization_1/batchnorm/Rsqrt_grad/RsqrtGrad"
  op: "RsqrtGrad"
  input: "batch_normalization_1/batchnorm/Rsqrt"
  input: "gradients/batch_normalization_1/batchnorm/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/Squeeze_grad/Shape"
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
        tensor_content: "\001\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/Squeeze_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_1/cond/Switch_1_grad/cond_grad"
  input: "gradients/batch_normalization_1/moments/Squeeze_grad/Shape"
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
  name: "gradients/batch_normalization_1/batchnorm/add_grad/Shape"
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
        int_val: 64
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/add_grad/Shape_1"
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
  name: "gradients/batch_normalization_1/batchnorm/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization_1/batchnorm/add_grad/Shape"
  input: "gradients/batch_normalization_1/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/add_grad/Sum"
  op: "Sum"
  input: "gradients/batch_normalization_1/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/batch_normalization_1/batchnorm/add_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization_1/batchnorm/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_1/batchnorm/add_grad/Sum"
  input: "gradients/batch_normalization_1/batchnorm/add_grad/Shape"
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
  name: "gradients/batch_normalization_1/batchnorm/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/batch_normalization_1/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/batch_normalization_1/batchnorm/add_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization_1/batchnorm/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization_1/batchnorm/add_grad/Sum_1"
  input: "gradients/batch_normalization_1/batchnorm/add_grad/Shape_1"
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
  name: "gradients/batch_normalization_1/batchnorm/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_1/batchnorm/add_grad/Reshape"
  input: "^gradients/batch_normalization_1/batchnorm/add_grad/Reshape_1"
}
node {
  name: "gradients/batch_normalization_1/batchnorm/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/add_grad/Reshape"
  input: "^gradients/batch_normalization_1/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/batchnorm/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_1/batchnorm/add_grad/Reshape_1"
  input: "^gradients/batch_normalization_1/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/cond_1/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/batch_normalization_1/batchnorm/add_grad/tuple/control_dependency"
  input: "batch_normalization_1/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/cond_1/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_1/cond_1/Merge_grad/cond_grad"
}
node {
  name: "gradients/batch_normalization_1/cond_1/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_1/cond_1/Merge_grad/cond_grad"
  input: "^gradients/batch_normalization_1/cond_1/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/cond_1/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_1/cond_1/Merge_grad/cond_grad:1"
  input: "^gradients/batch_normalization_1/cond_1/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Switch_3"
  op: "Switch"
  input: "batch_normalization_1/moments/Squeeze_1"
  input: "batch_normalization_1/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_3"
  op: "Identity"
  input: "gradients/Switch_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_4"
  op: "Shape"
  input: "gradients/Switch_3"
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
  name: "gradients/zeros_3/Const"
  op: "Const"
  input: "^gradients/Identity_3"
  attr {
    key: "dtype"
    value {
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
  name: "gradients/zeros_3"
  op: "Fill"
  input: "gradients/Shape_4"
  input: "gradients/zeros_3/Const"
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
  name: "gradients/batch_normalization_1/cond_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/zeros_3"
  input: "gradients/batch_normalization_1/cond_1/Merge_grad/tuple/control_dependency_1"
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
}
node {
  name: "gradients/batch_normalization_1/moments/Squeeze_1_grad/Shape"
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
        tensor_content: "\001\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/Squeeze_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_1/cond_1/Switch_1_grad/cond_grad"
  input: "gradients/batch_normalization_1/moments/Squeeze_1_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Shape"
  op: "Shape"
  input: "batch_normalization_1/moments/SquaredDifference"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
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
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/variance_grad/add"
  op: "Add"
  input: "batch_normalization_1/moments/variance/reduction_indices"
  input: "gradients/batch_normalization_1/moments/variance_grad/Size"
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
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/variance_grad/mod"
  op: "FloorMod"
  input: "gradients/batch_normalization_1/moments/variance_grad/add"
  input: "gradients/batch_normalization_1/moments/variance_grad/Size"
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
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/variance_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/range"
  op: "Range"
  input: "gradients/batch_normalization_1/moments/variance_grad/range/start"
  input: "gradients/batch_normalization_1/moments/variance_grad/Size"
  input: "gradients/batch_normalization_1/moments/variance_grad/range/delta"
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
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/variance_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Fill"
  op: "Fill"
  input: "gradients/batch_normalization_1/moments/variance_grad/Shape_1"
  input: "gradients/batch_normalization_1/moments/variance_grad/Fill/value"
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
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/batch_normalization_1/moments/variance_grad/range"
  input: "gradients/batch_normalization_1/moments/variance_grad/mod"
  input: "gradients/batch_normalization_1/moments/variance_grad/Shape"
  input: "gradients/batch_normalization_1/moments/variance_grad/Fill"
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
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/variance_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Maximum"
  op: "Maximum"
  input: "gradients/batch_normalization_1/moments/variance_grad/DynamicStitch"
  input: "gradients/batch_normalization_1/moments/variance_grad/Maximum/y"
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
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/variance_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/batch_normalization_1/moments/variance_grad/Shape"
  input: "gradients/batch_normalization_1/moments/variance_grad/Maximum"
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
        s: "loc:@gradients/batch_normalization_1/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/variance_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_1/moments/Squeeze_1_grad/Reshape"
  input: "gradients/batch_normalization_1/moments/variance_grad/DynamicStitch"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Tile"
  op: "Tile"
  input: "gradients/batch_normalization_1/moments/variance_grad/Reshape"
  input: "gradients/batch_normalization_1/moments/variance_grad/floordiv"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Shape_2"
  op: "Shape"
  input: "batch_normalization_1/moments/SquaredDifference"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Shape_3"
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
        tensor_content: "\001\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/variance_grad/Const"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Prod"
  op: "Prod"
  input: "gradients/batch_normalization_1/moments/variance_grad/Shape_2"
  input: "gradients/batch_normalization_1/moments/variance_grad/Const"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Const_1"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Prod_1"
  op: "Prod"
  input: "gradients/batch_normalization_1/moments/variance_grad/Shape_3"
  input: "gradients/batch_normalization_1/moments/variance_grad/Const_1"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Maximum_1/y"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/batch_normalization_1/moments/variance_grad/Prod_1"
  input: "gradients/batch_normalization_1/moments/variance_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/variance_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/batch_normalization_1/moments/variance_grad/Prod"
  input: "gradients/batch_normalization_1/moments/variance_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/variance_grad/Cast"
  op: "Cast"
  input: "gradients/batch_normalization_1/moments/variance_grad/floordiv_1"
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
  name: "gradients/batch_normalization_1/moments/variance_grad/truediv"
  op: "RealDiv"
  input: "gradients/batch_normalization_1/moments/variance_grad/Tile"
  input: "gradients/batch_normalization_1/moments/variance_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Shape"
  op: "Shape"
  input: "Add_1"
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
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Shape_1"
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
        tensor_content: "\001\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Shape"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/batch_normalization_1/moments/variance_grad/truediv"
  attr {
    key: "dtype"
    value {
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
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Mul"
  op: "Mul"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/scalar"
  input: "gradients/batch_normalization_1/moments/variance_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/sub"
  op: "Sub"
  input: "Add_1"
  input: "batch_normalization_1/moments/StopGradient"
  input: "^gradients/batch_normalization_1/moments/variance_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Mul"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/mul_1"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Sum"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/mul_1"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Sum_1"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Shape_1"
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
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization_1/moments/SquaredDifference_grad/Neg"
  input: "^gradients/batch_normalization_1/moments/SquaredDifference_grad/Reshape"
}
node {
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/batch_normalization_1/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/Neg"
  input: "^gradients/batch_normalization_1/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/mean_grad/Shape"
  op: "Shape"
  input: "Add_1"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
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
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/mean_grad/add"
  op: "Add"
  input: "batch_normalization_1/moments/mean/reduction_indices"
  input: "gradients/batch_normalization_1/moments/mean_grad/Size"
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
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/mean_grad/mod"
  op: "FloorMod"
  input: "gradients/batch_normalization_1/moments/mean_grad/add"
  input: "gradients/batch_normalization_1/moments/mean_grad/Size"
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
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/range"
  op: "Range"
  input: "gradients/batch_normalization_1/moments/mean_grad/range/start"
  input: "gradients/batch_normalization_1/moments/mean_grad/Size"
  input: "gradients/batch_normalization_1/moments/mean_grad/range/delta"
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
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/Fill"
  op: "Fill"
  input: "gradients/batch_normalization_1/moments/mean_grad/Shape_1"
  input: "gradients/batch_normalization_1/moments/mean_grad/Fill/value"
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
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/batch_normalization_1/moments/mean_grad/range"
  input: "gradients/batch_normalization_1/moments/mean_grad/mod"
  input: "gradients/batch_normalization_1/moments/mean_grad/Shape"
  input: "gradients/batch_normalization_1/moments/mean_grad/Fill"
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
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/batch_normalization_1/moments/mean_grad/DynamicStitch"
  input: "gradients/batch_normalization_1/moments/mean_grad/Maximum/y"
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
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/batch_normalization_1/moments/mean_grad/Shape"
  input: "gradients/batch_normalization_1/moments/mean_grad/Maximum"
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
        s: "loc:@gradients/batch_normalization_1/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization_1/moments/Squeeze_grad/Reshape"
  input: "gradients/batch_normalization_1/moments/mean_grad/DynamicStitch"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/Tile"
  op: "Tile"
  input: "gradients/batch_normalization_1/moments/mean_grad/Reshape"
  input: "gradients/batch_normalization_1/moments/mean_grad/floordiv"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/Shape_2"
  op: "Shape"
  input: "Add_1"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/Shape_3"
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
        tensor_content: "\001\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/mean_grad/Const"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/Prod"
  op: "Prod"
  input: "gradients/batch_normalization_1/moments/mean_grad/Shape_2"
  input: "gradients/batch_normalization_1/moments/mean_grad/Const"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/Const_1"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/batch_normalization_1/moments/mean_grad/Shape_3"
  input: "gradients/batch_normalization_1/moments/mean_grad/Const_1"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/Maximum_1/y"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/batch_normalization_1/moments/mean_grad/Prod_1"
  input: "gradients/batch_normalization_1/moments/mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/batch_normalization_1/moments/mean_grad/Prod"
  input: "gradients/batch_normalization_1/moments/mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization_1/moments/mean_grad/Cast"
  op: "Cast"
  input: "gradients/batch_normalization_1/moments/mean_grad/floordiv_1"
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
  name: "gradients/batch_normalization_1/moments/mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/batch_normalization_1/moments/mean_grad/Tile"
  input: "gradients/batch_normalization_1/moments/mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_4"
  op: "AddN"
  input: "gradients/batch_normalization_1/batchnorm/mul_1_grad/tuple/control_dependency"
  input: "gradients/batch_normalization_1/moments/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/batch_normalization_1/moments/mean_grad/truediv"
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
        s: "loc:@gradients/batch_normalization_1/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Add_1_grad/Shape"
  op: "Shape"
  input: "MatMul_1"
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
  name: "gradients/Add_1_grad/Shape_1"
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
        int_val: 64
      }
    }
  }
}
node {
  name: "gradients/Add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Add_1_grad/Shape"
  input: "gradients/Add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_1_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_4"
  input: "gradients/Add_1_grad/BroadcastGradientArgs"
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
  name: "gradients/Add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/Add_1_grad/Sum"
  input: "gradients/Add_1_grad/Shape"
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
  name: "gradients/Add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_4"
  input: "gradients/Add_1_grad/BroadcastGradientArgs:1"
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
  name: "gradients/Add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Add_1_grad/Sum_1"
  input: "gradients/Add_1_grad/Shape_1"
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
  name: "gradients/Add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Add_1_grad/Reshape"
  input: "^gradients/Add_1_grad/Reshape_1"
}
node {
  name: "gradients/Add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Add_1_grad/Reshape"
  input: "^gradients/Add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Add_1_grad/Reshape_1"
  input: "^gradients/Add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_1_grad/MatMul"
  op: "MatMul"
  input: "gradients/Add_1_grad/tuple/control_dependency"
  input: "W_1/read"
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
  input: "batch_normalization/batchnorm/add_1"
  input: "gradients/Add_1_grad/tuple/control_dependency"
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
  name: "gradients/batch_normalization/batchnorm/add_1_grad/Shape"
  op: "Shape"
  input: "batch_normalization/batchnorm/mul_1"
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
  name: "gradients/batch_normalization/batchnorm/add_1_grad/Shape_1"
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
        int_val: 128
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/Shape"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/MatMul_1_grad/tuple/control_dependency"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization/batchnorm/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/Sum"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/Shape"
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
  name: "gradients/batch_normalization/batchnorm/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/MatMul_1_grad/tuple/control_dependency"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization/batchnorm/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/Sum_1"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/Shape_1"
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
  name: "gradients/batch_normalization/batchnorm/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization/batchnorm/add_1_grad/Reshape"
  input: "^gradients/batch_normalization/batchnorm/add_1_grad/Reshape_1"
}
node {
  name: "gradients/batch_normalization/batchnorm/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/Reshape"
  input: "^gradients/batch_normalization/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/Reshape_1"
  input: "^gradients/batch_normalization/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/Shape"
  op: "Shape"
  input: "Add"
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
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/Shape_1"
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
        int_val: 128
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/Shape"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/tuple/control_dependency"
  input: "batch_normalization/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/Mul"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/Sum"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/Shape"
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
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/Mul_1"
  op: "Mul"
  input: "Add"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/Mul_1"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/Sum_1"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/Shape_1"
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
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/batch_normalization/batchnorm/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/batch_normalization/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/Reshape_1"
  input: "^gradients/batch_normalization/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/sub_grad/Neg"
  op: "Neg"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "^gradients/batch_normalization/batchnorm/sub_grad/Neg"
}
node {
  name: "gradients/batch_normalization/batchnorm/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "^gradients/batch_normalization/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/sub_grad/Neg"
  input: "^gradients/batch_normalization/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/sub_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_2_grad/Mul"
  op: "Mul"
  input: "gradients/batch_normalization/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "batch_normalization/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_2_grad/Mul_1"
  op: "Mul"
  input: "gradients/batch_normalization/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "batch_normalization/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization/batchnorm/mul_2_grad/Mul"
  input: "^gradients/batch_normalization/batchnorm/mul_2_grad/Mul_1"
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/mul_2_grad/Mul"
  input: "^gradients/batch_normalization/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/mul_2_grad/Mul_1"
  input: "^gradients/batch_normalization/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/mul_2_grad/Mul_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/batch_normalization/batchnorm/mul_2_grad/tuple/control_dependency"
  input: "batch_normalization/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/batch_normalization/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization/cond/Merge_grad/cond_grad"
  input: "^gradients/batch_normalization/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization/cond/Merge_grad/cond_grad:1"
  input: "^gradients/batch_normalization/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/mul_2_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/AddN_5"
  op: "AddN"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/batch_normalization/batchnorm/mul_2_grad/tuple/control_dependency_1"
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
        s: "loc:@gradients/batch_normalization/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_grad/Mul"
  op: "Mul"
  input: "gradients/AddN_5"
  input: "batch_normalization/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_grad/Mul_1"
  op: "Mul"
  input: "gradients/AddN_5"
  input: "batch_normalization/batchnorm/Rsqrt"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization/batchnorm/mul_grad/Mul"
  input: "^gradients/batch_normalization/batchnorm/mul_grad/Mul_1"
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/mul_grad/Mul"
  input: "^gradients/batch_normalization/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/mul_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/mul_grad/Mul_1"
  input: "^gradients/batch_normalization/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/mul_grad/Mul_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_4"
  op: "Switch"
  input: "batch_normalization/moments/Squeeze"
  input: "batch_normalization/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_4"
  op: "Identity"
  input: "gradients/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_5"
  op: "Shape"
  input: "gradients/Switch_4"
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
  name: "gradients/zeros_4/Const"
  op: "Const"
  input: "^gradients/Identity_4"
  attr {
    key: "dtype"
    value {
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
  name: "gradients/zeros_4"
  op: "Fill"
  input: "gradients/Shape_5"
  input: "gradients/zeros_4/Const"
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
  name: "gradients/batch_normalization/cond/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/zeros_4"
  input: "gradients/batch_normalization/cond/Merge_grad/tuple/control_dependency_1"
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
}
node {
  name: "gradients/batch_normalization/batchnorm/Rsqrt_grad/RsqrtGrad"
  op: "RsqrtGrad"
  input: "batch_normalization/batchnorm/Rsqrt"
  input: "gradients/batch_normalization/batchnorm/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/Squeeze_grad/Shape"
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
        tensor_content: "\001\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/Squeeze_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization/cond/Switch_1_grad/cond_grad"
  input: "gradients/batch_normalization/moments/Squeeze_grad/Shape"
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
  name: "gradients/batch_normalization/batchnorm/add_grad/Shape"
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
        int_val: 128
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/add_grad/Shape_1"
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
  name: "gradients/batch_normalization/batchnorm/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization/batchnorm/add_grad/Shape"
  input: "gradients/batch_normalization/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/add_grad/Sum"
  op: "Sum"
  input: "gradients/batch_normalization/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/batch_normalization/batchnorm/add_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization/batchnorm/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization/batchnorm/add_grad/Sum"
  input: "gradients/batch_normalization/batchnorm/add_grad/Shape"
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
  name: "gradients/batch_normalization/batchnorm/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/batch_normalization/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/batch_normalization/batchnorm/add_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization/batchnorm/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization/batchnorm/add_grad/Sum_1"
  input: "gradients/batch_normalization/batchnorm/add_grad/Shape_1"
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
  name: "gradients/batch_normalization/batchnorm/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization/batchnorm/add_grad/Reshape"
  input: "^gradients/batch_normalization/batchnorm/add_grad/Reshape_1"
}
node {
  name: "gradients/batch_normalization/batchnorm/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/add_grad/Reshape"
  input: "^gradients/batch_normalization/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/batchnorm/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization/batchnorm/add_grad/Reshape_1"
  input: "^gradients/batch_normalization/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/cond_1/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/batch_normalization/batchnorm/add_grad/tuple/control_dependency"
  input: "batch_normalization/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/cond_1/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization/cond_1/Merge_grad/cond_grad"
}
node {
  name: "gradients/batch_normalization/cond_1/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization/cond_1/Merge_grad/cond_grad"
  input: "^gradients/batch_normalization/cond_1/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/cond_1/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization/cond_1/Merge_grad/cond_grad:1"
  input: "^gradients/batch_normalization/cond_1/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Switch_5"
  op: "Switch"
  input: "batch_normalization/moments/Squeeze_1"
  input: "batch_normalization/cond_1/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_5"
  op: "Identity"
  input: "gradients/Switch_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_6"
  op: "Shape"
  input: "gradients/Switch_5"
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
  name: "gradients/zeros_5/Const"
  op: "Const"
  input: "^gradients/Identity_5"
  attr {
    key: "dtype"
    value {
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
  name: "gradients/zeros_5"
  op: "Fill"
  input: "gradients/Shape_6"
  input: "gradients/zeros_5/Const"
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
  name: "gradients/batch_normalization/cond_1/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "gradients/zeros_5"
  input: "gradients/batch_normalization/cond_1/Merge_grad/tuple/control_dependency_1"
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
}
node {
  name: "gradients/batch_normalization/moments/Squeeze_1_grad/Shape"
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
        tensor_content: "\001\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/Squeeze_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization/cond_1/Switch_1_grad/cond_grad"
  input: "gradients/batch_normalization/moments/Squeeze_1_grad/Shape"
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
  name: "gradients/batch_normalization/moments/variance_grad/Shape"
  op: "Shape"
  input: "batch_normalization/moments/SquaredDifference"
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
  name: "gradients/batch_normalization/moments/variance_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
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
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/variance_grad/add"
  op: "Add"
  input: "batch_normalization/moments/variance/reduction_indices"
  input: "gradients/batch_normalization/moments/variance_grad/Size"
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
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/variance_grad/mod"
  op: "FloorMod"
  input: "gradients/batch_normalization/moments/variance_grad/add"
  input: "gradients/batch_normalization/moments/variance_grad/Size"
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
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/variance_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization/moments/variance_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization/moments/variance_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization/moments/variance_grad/range"
  op: "Range"
  input: "gradients/batch_normalization/moments/variance_grad/range/start"
  input: "gradients/batch_normalization/moments/variance_grad/Size"
  input: "gradients/batch_normalization/moments/variance_grad/range/delta"
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
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/variance_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization/moments/variance_grad/Fill"
  op: "Fill"
  input: "gradients/batch_normalization/moments/variance_grad/Shape_1"
  input: "gradients/batch_normalization/moments/variance_grad/Fill/value"
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
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization/moments/variance_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/batch_normalization/moments/variance_grad/range"
  input: "gradients/batch_normalization/moments/variance_grad/mod"
  input: "gradients/batch_normalization/moments/variance_grad/Shape"
  input: "gradients/batch_normalization/moments/variance_grad/Fill"
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
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/variance_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
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
  name: "gradients/batch_normalization/moments/variance_grad/Maximum"
  op: "Maximum"
  input: "gradients/batch_normalization/moments/variance_grad/DynamicStitch"
  input: "gradients/batch_normalization/moments/variance_grad/Maximum/y"
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
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/variance_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/batch_normalization/moments/variance_grad/Shape"
  input: "gradients/batch_normalization/moments/variance_grad/Maximum"
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
        s: "loc:@gradients/batch_normalization/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/variance_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization/moments/Squeeze_1_grad/Reshape"
  input: "gradients/batch_normalization/moments/variance_grad/DynamicStitch"
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
  name: "gradients/batch_normalization/moments/variance_grad/Tile"
  op: "Tile"
  input: "gradients/batch_normalization/moments/variance_grad/Reshape"
  input: "gradients/batch_normalization/moments/variance_grad/floordiv"
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
  name: "gradients/batch_normalization/moments/variance_grad/Shape_2"
  op: "Shape"
  input: "batch_normalization/moments/SquaredDifference"
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
  name: "gradients/batch_normalization/moments/variance_grad/Shape_3"
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
        tensor_content: "\001\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/variance_grad/Const"
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
  name: "gradients/batch_normalization/moments/variance_grad/Prod"
  op: "Prod"
  input: "gradients/batch_normalization/moments/variance_grad/Shape_2"
  input: "gradients/batch_normalization/moments/variance_grad/Const"
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
  name: "gradients/batch_normalization/moments/variance_grad/Const_1"
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
  name: "gradients/batch_normalization/moments/variance_grad/Prod_1"
  op: "Prod"
  input: "gradients/batch_normalization/moments/variance_grad/Shape_3"
  input: "gradients/batch_normalization/moments/variance_grad/Const_1"
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
  name: "gradients/batch_normalization/moments/variance_grad/Maximum_1/y"
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
  name: "gradients/batch_normalization/moments/variance_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/batch_normalization/moments/variance_grad/Prod_1"
  input: "gradients/batch_normalization/moments/variance_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/variance_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/batch_normalization/moments/variance_grad/Prod"
  input: "gradients/batch_normalization/moments/variance_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/variance_grad/Cast"
  op: "Cast"
  input: "gradients/batch_normalization/moments/variance_grad/floordiv_1"
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
  name: "gradients/batch_normalization/moments/variance_grad/truediv"
  op: "RealDiv"
  input: "gradients/batch_normalization/moments/variance_grad/Tile"
  input: "gradients/batch_normalization/moments/variance_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/Shape"
  op: "Shape"
  input: "Add"
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
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/Shape_1"
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
        tensor_content: "\001\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/Shape"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/batch_normalization/moments/variance_grad/truediv"
  attr {
    key: "dtype"
    value {
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
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/Mul"
  op: "Mul"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/scalar"
  input: "gradients/batch_normalization/moments/variance_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/sub"
  op: "Sub"
  input: "Add"
  input: "batch_normalization/moments/StopGradient"
  input: "^gradients/batch_normalization/moments/variance_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/Mul"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/mul_1"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/BroadcastGradientArgs"
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
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/Sum"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/Shape"
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
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/mul_1"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/BroadcastGradientArgs:1"
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
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/Sum_1"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/Shape_1"
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
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/batch_normalization/moments/SquaredDifference_grad/Neg"
  input: "^gradients/batch_normalization/moments/SquaredDifference_grad/Reshape"
}
node {
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/batch_normalization/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/Neg"
  input: "^gradients/batch_normalization/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/mean_grad/Shape"
  op: "Shape"
  input: "Add"
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
  name: "gradients/batch_normalization/moments/mean_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
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
        int_val: 2
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/mean_grad/add"
  op: "Add"
  input: "batch_normalization/moments/mean/reduction_indices"
  input: "gradients/batch_normalization/moments/mean_grad/Size"
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
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/mean_grad/mod"
  op: "FloorMod"
  input: "gradients/batch_normalization/moments/mean_grad/add"
  input: "gradients/batch_normalization/moments/mean_grad/Size"
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
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization/moments/mean_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization/moments/mean_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization/moments/mean_grad/range"
  op: "Range"
  input: "gradients/batch_normalization/moments/mean_grad/range/start"
  input: "gradients/batch_normalization/moments/mean_grad/Size"
  input: "gradients/batch_normalization/moments/mean_grad/range/delta"
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
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization/moments/mean_grad/Fill"
  op: "Fill"
  input: "gradients/batch_normalization/moments/mean_grad/Shape_1"
  input: "gradients/batch_normalization/moments/mean_grad/Fill/value"
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
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization/moments/mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/batch_normalization/moments/mean_grad/range"
  input: "gradients/batch_normalization/moments/mean_grad/mod"
  input: "gradients/batch_normalization/moments/mean_grad/Shape"
  input: "gradients/batch_normalization/moments/mean_grad/Fill"
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
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
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
  name: "gradients/batch_normalization/moments/mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/batch_normalization/moments/mean_grad/DynamicStitch"
  input: "gradients/batch_normalization/moments/mean_grad/Maximum/y"
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
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/batch_normalization/moments/mean_grad/Shape"
  input: "gradients/batch_normalization/moments/mean_grad/Maximum"
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
        s: "loc:@gradients/batch_normalization/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/batch_normalization/moments/Squeeze_grad/Reshape"
  input: "gradients/batch_normalization/moments/mean_grad/DynamicStitch"
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
  name: "gradients/batch_normalization/moments/mean_grad/Tile"
  op: "Tile"
  input: "gradients/batch_normalization/moments/mean_grad/Reshape"
  input: "gradients/batch_normalization/moments/mean_grad/floordiv"
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
  name: "gradients/batch_normalization/moments/mean_grad/Shape_2"
  op: "Shape"
  input: "Add"
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
  name: "gradients/batch_normalization/moments/mean_grad/Shape_3"
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
        tensor_content: "\001\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/mean_grad/Const"
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
  name: "gradients/batch_normalization/moments/mean_grad/Prod"
  op: "Prod"
  input: "gradients/batch_normalization/moments/mean_grad/Shape_2"
  input: "gradients/batch_normalization/moments/mean_grad/Const"
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
  name: "gradients/batch_normalization/moments/mean_grad/Const_1"
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
  name: "gradients/batch_normalization/moments/mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/batch_normalization/moments/mean_grad/Shape_3"
  input: "gradients/batch_normalization/moments/mean_grad/Const_1"
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
  name: "gradients/batch_normalization/moments/mean_grad/Maximum_1/y"
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
  name: "gradients/batch_normalization/moments/mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/batch_normalization/moments/mean_grad/Prod_1"
  input: "gradients/batch_normalization/moments/mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/batch_normalization/moments/mean_grad/Prod"
  input: "gradients/batch_normalization/moments/mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/batch_normalization/moments/mean_grad/Cast"
  op: "Cast"
  input: "gradients/batch_normalization/moments/mean_grad/floordiv_1"
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
  name: "gradients/batch_normalization/moments/mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/batch_normalization/moments/mean_grad/Tile"
  input: "gradients/batch_normalization/moments/mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_6"
  op: "AddN"
  input: "gradients/batch_normalization/batchnorm/mul_1_grad/tuple/control_dependency"
  input: "gradients/batch_normalization/moments/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/batch_normalization/moments/mean_grad/truediv"
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
        s: "loc:@gradients/batch_normalization/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Add_grad/Shape"
  op: "Shape"
  input: "MatMul"
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
  name: "gradients/Add_grad/Shape_1"
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
        int_val: 128
      }
    }
  }
}
node {
  name: "gradients/Add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Add_grad/Shape"
  input: "gradients/Add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_6"
  input: "gradients/Add_grad/BroadcastGradientArgs"
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
  name: "gradients/Add_grad/Reshape"
  op: "Reshape"
  input: "gradients/Add_grad/Sum"
  input: "gradients/Add_grad/Shape"
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
  name: "gradients/Add_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_6"
  input: "gradients/Add_grad/BroadcastGradientArgs:1"
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
  name: "gradients/Add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Add_grad/Sum_1"
  input: "gradients/Add_grad/Shape_1"
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
  name: "gradients/Add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Add_grad/Reshape"
  input: "^gradients/Add_grad/Reshape_1"
}
node {
  name: "gradients/Add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Add_grad/Reshape"
  input: "^gradients/Add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Add_grad/Reshape_1"
  input: "^gradients/Add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/Add_grad/tuple/control_dependency"
  input: "W_0/read"
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
  input: "concat_3"
  input: "gradients/Add_grad/tuple/control_dependency"
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
  name: "gradients/concat_3_grad/ShapeN"
  op: "ShapeN"
  input: "concat_1"
  input: "Placeholder_4"
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
  input: "gradients/MatMul_grad/tuple/control_dependency"
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
  input: "gradients/MatMul_grad/tuple/control_dependency"
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
  name: "gradients/AddN_7"
  op: "AddN"
  input: "gradients/concat_2_grad/tuple/control_dependency"
  input: "gradients/concat_3_grad/tuple/control_dependency"
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
        s: "loc:@gradients/concat_2_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/Reshape_2_grad/Shape"
  op: "Shape"
  input: "embedding_lookup_2/Identity"
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
  name: "gradients/Reshape_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/AddN_7"
  input: "gradients/Reshape_2_grad/Shape"
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
  name: "gradients/embedding_lookup_2_grad/Shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
        tensor_content: "\020\'\000\000\000\000\000\000\020\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/embedding_lookup_2_grad/Cast"
  op: "Cast"
  input: "gradients/embedding_lookup_2_grad/Shape"
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
        s: "loc:@single_second_embedding"
      }
    }
  }
}
node {
  name: "gradients/embedding_lookup_2_grad/Size"
  op: "Size"
  input: "Placeholder_2"
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
  name: "gradients/embedding_lookup_2_grad/ExpandDims/dim"
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
  name: "gradients/embedding_lookup_2_grad/ExpandDims"
  op: "ExpandDims"
  input: "gradients/embedding_lookup_2_grad/Size"
  input: "gradients/embedding_lookup_2_grad/ExpandDims/dim"
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
  name: "gradients/embedding_lookup_2_grad/strided_slice/stack"
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
  name: "gradients/embedding_lookup_2_grad/strided_slice/stack_1"
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
  name: "gradients/embedding_lookup_2_grad/strided_slice/stack_2"
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
  name: "gradients/embedding_lookup_2_grad/strided_slice"
  op: "StridedSlice"
  input: "gradients/embedding_lookup_2_grad/Cast"
  input: "gradients/embedding_lookup_2_grad/strided_slice/stack"
  input: "gradients/embedding_lookup_2_grad/strided_slice/stack_1"
  input: "gradients/embedding_lookup_2_grad/strided_slice/stack_2"
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
  name: "gradients/embedding_lookup_2_grad/concat/axis"
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
  name: "gradients/embedding_lookup_2_grad/concat"
  op: "ConcatV2"
  input: "gradients/embedding_lookup_2_grad/ExpandDims"
  input: "gradients/embedding_lookup_2_grad/strided_slice"
  input: "gradients/embedding_lookup_2_grad/concat/axis"
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
  name: "gradients/embedding_lookup_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/Reshape_2_grad/Reshape"
  input: "gradients/embedding_lookup_2_grad/concat"
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
  name: "gradients/embedding_lookup_2_grad/Reshape_1"
  op: "Reshape"
  input: "Placeholder_2"
  input: "gradients/embedding_lookup_2_grad/ExpandDims"
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
  name: "single_second_embedding/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
            size: 10000
          }
          dim {
            size: 16
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "single_second_embedding/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
          size: 10000
        }
        dim {
          size: 16
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
  name: "single_second_embedding/Adagrad/Assign"
  op: "Assign"
  input: "single_second_embedding/Adagrad"
  input: "single_second_embedding/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
  name: "single_second_embedding/Adagrad/read"
  op: "Identity"
  input: "single_second_embedding/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
      }
    }
  }
}
node {
  name: "numerical_second_embedding/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
            size: 10000
          }
          dim {
            size: 16
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "numerical_second_embedding/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
          size: 10000
        }
        dim {
          size: 16
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
  name: "numerical_second_embedding/Adagrad/Assign"
  op: "Assign"
  input: "numerical_second_embedding/Adagrad"
  input: "numerical_second_embedding/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
  name: "numerical_second_embedding/Adagrad/read"
  op: "Identity"
  input: "numerical_second_embedding/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
      }
    }
  }
}
node {
  name: "single_first_embedding/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
            size: 10000
          }
          dim {
            size: 1
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "single_first_embedding/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
          size: 10000
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
  name: "single_first_embedding/Adagrad/Assign"
  op: "Assign"
  input: "single_first_embedding/Adagrad"
  input: "single_first_embedding/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
  name: "single_first_embedding/Adagrad/read"
  op: "Identity"
  input: "single_first_embedding/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
      }
    }
  }
}
node {
  name: "numerical_first_embedding/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
            size: 10000
          }
          dim {
            size: 1
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "numerical_first_embedding/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
          size: 10000
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
  name: "numerical_first_embedding/Adagrad/Assign"
  op: "Assign"
  input: "numerical_first_embedding/Adagrad"
  input: "numerical_first_embedding/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
  name: "numerical_first_embedding/Adagrad/read"
  op: "Identity"
  input: "numerical_first_embedding/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
      }
    }
  }
}
node {
  name: "W_0/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
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
            size: 41
          }
          dim {
            size: 128
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "W_0/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
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
          size: 41
        }
        dim {
          size: 128
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
  name: "W_0/Adagrad/Assign"
  op: "Assign"
  input: "W_0/Adagrad"
  input: "W_0/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
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
  name: "W_0/Adagrad/read"
  op: "Identity"
  input: "W_0/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
      }
    }
  }
}
node {
  name: "b_0/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_0"
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
            size: 128
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "b_0/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_0"
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
          size: 128
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
  name: "b_0/Adagrad/Assign"
  op: "Assign"
  input: "b_0/Adagrad"
  input: "b_0/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_0"
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
  name: "b_0/Adagrad/read"
  op: "Identity"
  input: "b_0/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_0"
      }
    }
  }
}
node {
  name: "W_1/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
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
            size: 128
          }
          dim {
            size: 64
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "W_1/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
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
          size: 128
        }
        dim {
          size: 64
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
  name: "W_1/Adagrad/Assign"
  op: "Assign"
  input: "W_1/Adagrad"
  input: "W_1/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
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
  name: "W_1/Adagrad/read"
  op: "Identity"
  input: "W_1/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
      }
    }
  }
}
node {
  name: "b_1/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_1"
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
            size: 64
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "b_1/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_1"
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
          size: 64
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
  name: "b_1/Adagrad/Assign"
  op: "Assign"
  input: "b_1/Adagrad"
  input: "b_1/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_1"
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
  name: "b_1/Adagrad/read"
  op: "Identity"
  input: "b_1/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_1"
      }
    }
  }
}
node {
  name: "W_2/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
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
            size: 64
          }
          dim {
            size: 32
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "W_2/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
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
          size: 64
        }
        dim {
          size: 32
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
  name: "W_2/Adagrad/Assign"
  op: "Assign"
  input: "W_2/Adagrad"
  input: "W_2/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
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
  name: "W_2/Adagrad/read"
  op: "Identity"
  input: "W_2/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
      }
    }
  }
}
node {
  name: "b_2/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_2"
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
            size: 32
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "b_2/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_2"
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
          size: 32
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
  name: "b_2/Adagrad/Assign"
  op: "Assign"
  input: "b_2/Adagrad"
  input: "b_2/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_2"
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
  name: "b_2/Adagrad/read"
  op: "Identity"
  input: "b_2/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_2"
      }
    }
  }
}
node {
  name: "batch_normalization/gamma/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/gamma"
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
            size: 128
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "batch_normalization/gamma/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/gamma"
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
          size: 128
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
  name: "batch_normalization/gamma/Adagrad/Assign"
  op: "Assign"
  input: "batch_normalization/gamma/Adagrad"
  input: "batch_normalization/gamma/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/gamma"
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
  name: "batch_normalization/gamma/Adagrad/read"
  op: "Identity"
  input: "batch_normalization/gamma/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/gamma"
      }
    }
  }
}
node {
  name: "batch_normalization/beta/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/beta"
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
            size: 128
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "batch_normalization/beta/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/beta"
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
          size: 128
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
  name: "batch_normalization/beta/Adagrad/Assign"
  op: "Assign"
  input: "batch_normalization/beta/Adagrad"
  input: "batch_normalization/beta/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/beta"
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
  name: "batch_normalization/beta/Adagrad/read"
  op: "Identity"
  input: "batch_normalization/beta/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/beta"
      }
    }
  }
}
node {
  name: "batch_normalization_1/gamma/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/gamma"
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
            size: 64
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "batch_normalization_1/gamma/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/gamma"
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
          size: 64
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
  name: "batch_normalization_1/gamma/Adagrad/Assign"
  op: "Assign"
  input: "batch_normalization_1/gamma/Adagrad"
  input: "batch_normalization_1/gamma/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/gamma"
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
  name: "batch_normalization_1/gamma/Adagrad/read"
  op: "Identity"
  input: "batch_normalization_1/gamma/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/gamma"
      }
    }
  }
}
node {
  name: "batch_normalization_1/beta/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/beta"
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
            size: 64
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "batch_normalization_1/beta/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/beta"
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
          size: 64
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
  name: "batch_normalization_1/beta/Adagrad/Assign"
  op: "Assign"
  input: "batch_normalization_1/beta/Adagrad"
  input: "batch_normalization_1/beta/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/beta"
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
  name: "batch_normalization_1/beta/Adagrad/read"
  op: "Identity"
  input: "batch_normalization_1/beta/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/beta"
      }
    }
  }
}
node {
  name: "batch_normalization_2/gamma/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/gamma"
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
            size: 32
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "batch_normalization_2/gamma/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/gamma"
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
          size: 32
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
  name: "batch_normalization_2/gamma/Adagrad/Assign"
  op: "Assign"
  input: "batch_normalization_2/gamma/Adagrad"
  input: "batch_normalization_2/gamma/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/gamma"
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
  name: "batch_normalization_2/gamma/Adagrad/read"
  op: "Identity"
  input: "batch_normalization_2/gamma/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/gamma"
      }
    }
  }
}
node {
  name: "batch_normalization_2/beta/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/beta"
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
            size: 32
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "batch_normalization_2/beta/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/beta"
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
          size: 32
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
  name: "batch_normalization_2/beta/Adagrad/Assign"
  op: "Assign"
  input: "batch_normalization_2/beta/Adagrad"
  input: "batch_normalization_2/beta/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/beta"
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
  name: "batch_normalization_2/beta/Adagrad/read"
  op: "Identity"
  input: "batch_normalization_2/beta/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/beta"
      }
    }
  }
}
node {
  name: "final_w/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
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
            size: 59
          }
          dim {
            size: 2
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "final_w/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
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
          size: 59
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
  name: "final_w/Adagrad/Assign"
  op: "Assign"
  input: "final_w/Adagrad"
  input: "final_w/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
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
  name: "final_w/Adagrad/read"
  op: "Identity"
  input: "final_w/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
      }
    }
  }
}
node {
  name: "final_b/Adagrad/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_b"
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
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "final_b/Adagrad"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_b"
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
  name: "final_b/Adagrad/Assign"
  op: "Assign"
  input: "final_b/Adagrad"
  input: "final_b/Adagrad/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_b"
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
  name: "final_b/Adagrad/read"
  op: "Identity"
  input: "final_b/Adagrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_b"
      }
    }
  }
}
node {
  name: "Adagrad/learning_rate"
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
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "Adagrad/update_single_second_embedding/Unique"
  op: "Unique"
  input: "gradients/embedding_lookup_2_grad/Reshape_1"
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
        s: "loc:@single_second_embedding"
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
  name: "Adagrad/update_single_second_embedding/Shape"
  op: "Shape"
  input: "Adagrad/update_single_second_embedding/Unique"
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
        s: "loc:@single_second_embedding"
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
  name: "Adagrad/update_single_second_embedding/strided_slice/stack"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
  name: "Adagrad/update_single_second_embedding/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
  name: "Adagrad/update_single_second_embedding/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_second_embedding"
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
  name: "Adagrad/update_single_second_embedding/strided_slice"
  op: "StridedSlice"
  input: "Adagrad/update_single_second_embedding/Shape"
  input: "Adagrad/update_single_second_embedding/strided_slice/stack"
  input: "Adagrad/update_single_second_embedding/strided_slice/stack_1"
  input: "Adagrad/update_single_second_embedding/strided_slice/stack_2"
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
        s: "loc:@single_second_embedding"
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
  name: "Adagrad/update_single_second_embedding/UnsortedSegmentSum"
  op: "UnsortedSegmentSum"
  input: "gradients/embedding_lookup_2_grad/Reshape"
  input: "Adagrad/update_single_second_embedding/Unique:1"
  input: "Adagrad/update_single_second_embedding/strided_slice"
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
        s: "loc:@single_second_embedding"
      }
    }
  }
}
node {
  name: "Adagrad/update_single_second_embedding/SparseApplyAdagrad"
  op: "SparseApplyAdagrad"
  input: "single_second_embedding"
  input: "single_second_embedding/Adagrad"
  input: "Adagrad/learning_rate"
  input: "Adagrad/update_single_second_embedding/UnsortedSegmentSum"
  input: "Adagrad/update_single_second_embedding/Unique"
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
        s: "loc:@single_second_embedding"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_numerical_second_embedding/Unique"
  op: "Unique"
  input: "gradients/embedding_lookup_3_grad/Reshape_1"
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
        s: "loc:@numerical_second_embedding"
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
  name: "Adagrad/update_numerical_second_embedding/Shape"
  op: "Shape"
  input: "Adagrad/update_numerical_second_embedding/Unique"
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
        s: "loc:@numerical_second_embedding"
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
  name: "Adagrad/update_numerical_second_embedding/strided_slice/stack"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
  name: "Adagrad/update_numerical_second_embedding/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
  name: "Adagrad/update_numerical_second_embedding/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_second_embedding"
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
  name: "Adagrad/update_numerical_second_embedding/strided_slice"
  op: "StridedSlice"
  input: "Adagrad/update_numerical_second_embedding/Shape"
  input: "Adagrad/update_numerical_second_embedding/strided_slice/stack"
  input: "Adagrad/update_numerical_second_embedding/strided_slice/stack_1"
  input: "Adagrad/update_numerical_second_embedding/strided_slice/stack_2"
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
        s: "loc:@numerical_second_embedding"
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
  name: "Adagrad/update_numerical_second_embedding/UnsortedSegmentSum"
  op: "UnsortedSegmentSum"
  input: "gradients/embedding_lookup_3_grad/Reshape"
  input: "Adagrad/update_numerical_second_embedding/Unique:1"
  input: "Adagrad/update_numerical_second_embedding/strided_slice"
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
        s: "loc:@numerical_second_embedding"
      }
    }
  }
}
node {
  name: "Adagrad/update_numerical_second_embedding/SparseApplyAdagrad"
  op: "SparseApplyAdagrad"
  input: "numerical_second_embedding"
  input: "numerical_second_embedding/Adagrad"
  input: "Adagrad/learning_rate"
  input: "Adagrad/update_numerical_second_embedding/UnsortedSegmentSum"
  input: "Adagrad/update_numerical_second_embedding/Unique"
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
        s: "loc:@numerical_second_embedding"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_single_first_embedding/Unique"
  op: "Unique"
  input: "gradients/embedding_lookup_grad/Reshape_1"
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
        s: "loc:@single_first_embedding"
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
  name: "Adagrad/update_single_first_embedding/Shape"
  op: "Shape"
  input: "Adagrad/update_single_first_embedding/Unique"
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
        s: "loc:@single_first_embedding"
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
  name: "Adagrad/update_single_first_embedding/strided_slice/stack"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
  name: "Adagrad/update_single_first_embedding/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
  name: "Adagrad/update_single_first_embedding/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@single_first_embedding"
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
  name: "Adagrad/update_single_first_embedding/strided_slice"
  op: "StridedSlice"
  input: "Adagrad/update_single_first_embedding/Shape"
  input: "Adagrad/update_single_first_embedding/strided_slice/stack"
  input: "Adagrad/update_single_first_embedding/strided_slice/stack_1"
  input: "Adagrad/update_single_first_embedding/strided_slice/stack_2"
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
        s: "loc:@single_first_embedding"
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
  name: "Adagrad/update_single_first_embedding/UnsortedSegmentSum"
  op: "UnsortedSegmentSum"
  input: "gradients/embedding_lookup_grad/Reshape"
  input: "Adagrad/update_single_first_embedding/Unique:1"
  input: "Adagrad/update_single_first_embedding/strided_slice"
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
        s: "loc:@single_first_embedding"
      }
    }
  }
}
node {
  name: "Adagrad/update_single_first_embedding/SparseApplyAdagrad"
  op: "SparseApplyAdagrad"
  input: "single_first_embedding"
  input: "single_first_embedding/Adagrad"
  input: "Adagrad/learning_rate"
  input: "Adagrad/update_single_first_embedding/UnsortedSegmentSum"
  input: "Adagrad/update_single_first_embedding/Unique"
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
        s: "loc:@single_first_embedding"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_numerical_first_embedding/Unique"
  op: "Unique"
  input: "gradients/embedding_lookup_1_grad/Reshape_1"
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
        s: "loc:@numerical_first_embedding"
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
  name: "Adagrad/update_numerical_first_embedding/Shape"
  op: "Shape"
  input: "Adagrad/update_numerical_first_embedding/Unique"
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
        s: "loc:@numerical_first_embedding"
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
  name: "Adagrad/update_numerical_first_embedding/strided_slice/stack"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
  name: "Adagrad/update_numerical_first_embedding/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
  name: "Adagrad/update_numerical_first_embedding/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@numerical_first_embedding"
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
  name: "Adagrad/update_numerical_first_embedding/strided_slice"
  op: "StridedSlice"
  input: "Adagrad/update_numerical_first_embedding/Shape"
  input: "Adagrad/update_numerical_first_embedding/strided_slice/stack"
  input: "Adagrad/update_numerical_first_embedding/strided_slice/stack_1"
  input: "Adagrad/update_numerical_first_embedding/strided_slice/stack_2"
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
        s: "loc:@numerical_first_embedding"
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
  name: "Adagrad/update_numerical_first_embedding/UnsortedSegmentSum"
  op: "UnsortedSegmentSum"
  input: "gradients/embedding_lookup_1_grad/Reshape"
  input: "Adagrad/update_numerical_first_embedding/Unique:1"
  input: "Adagrad/update_numerical_first_embedding/strided_slice"
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
        s: "loc:@numerical_first_embedding"
      }
    }
  }
}
node {
  name: "Adagrad/update_numerical_first_embedding/SparseApplyAdagrad"
  op: "SparseApplyAdagrad"
  input: "numerical_first_embedding"
  input: "numerical_first_embedding/Adagrad"
  input: "Adagrad/learning_rate"
  input: "Adagrad/update_numerical_first_embedding/UnsortedSegmentSum"
  input: "Adagrad/update_numerical_first_embedding/Unique"
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
        s: "loc:@numerical_first_embedding"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_W_0/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "W_0"
  input: "W_0/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_0"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_b_0/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "b_0"
  input: "b_0/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/Add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_0"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_W_1/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "W_1"
  input: "W_1/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/MatMul_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_1"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_b_1/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "b_1"
  input: "b_1/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/Add_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_1"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_W_2/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "W_2"
  input: "W_2/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/MatMul_2_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@W_2"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_b_2/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "b_2"
  input: "b_2/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/Add_2_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@b_2"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_batch_normalization/gamma/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "batch_normalization/gamma"
  input: "batch_normalization/gamma/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/batch_normalization/batchnorm/mul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/gamma"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_batch_normalization/beta/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "batch_normalization/beta"
  input: "batch_normalization/beta/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/batch_normalization/batchnorm/sub_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization/beta"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_batch_normalization_1/gamma/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "batch_normalization_1/gamma"
  input: "batch_normalization_1/gamma/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/batch_normalization_1/batchnorm/mul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/gamma"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_batch_normalization_1/beta/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "batch_normalization_1/beta"
  input: "batch_normalization_1/beta/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/batch_normalization_1/batchnorm/sub_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_1/beta"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_batch_normalization_2/gamma/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "batch_normalization_2/gamma"
  input: "batch_normalization_2/gamma/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/batch_normalization_2/batchnorm/mul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/gamma"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_batch_normalization_2/beta/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "batch_normalization_2/beta"
  input: "batch_normalization_2/beta/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/batch_normalization_2/batchnorm/sub_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@batch_normalization_2/beta"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_final_w/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "final_w"
  input: "final_w/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/MatMul_6_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_w"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad/update_final_b/ApplyAdagrad"
  op: "ApplyAdagrad"
  input: "final_b"
  input: "final_b/Adagrad"
  input: "Adagrad/learning_rate"
  input: "gradients/Add_3_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@final_b"
      }
    }
  }
  attr {
    key: "update_slots"
    value {
      b: true
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
  name: "Adagrad"
  op: "NoOp"
  input: "^Adagrad/update_W_0/ApplyAdagrad"
  input: "^Adagrad/update_W_1/ApplyAdagrad"
  input: "^Adagrad/update_W_2/ApplyAdagrad"
  input: "^Adagrad/update_b_0/ApplyAdagrad"
  input: "^Adagrad/update_b_1/ApplyAdagrad"
  input: "^Adagrad/update_b_2/ApplyAdagrad"
  input: "^Adagrad/update_batch_normalization/beta/ApplyAdagrad"
  input: "^Adagrad/update_batch_normalization/gamma/ApplyAdagrad"
  input: "^Adagrad/update_batch_normalization_1/beta/ApplyAdagrad"
  input: "^Adagrad/update_batch_normalization_1/gamma/ApplyAdagrad"
  input: "^Adagrad/update_batch_normalization_2/beta/ApplyAdagrad"
  input: "^Adagrad/update_batch_normalization_2/gamma/ApplyAdagrad"
  input: "^Adagrad/update_final_b/ApplyAdagrad"
  input: "^Adagrad/update_final_w/ApplyAdagrad"
  input: "^Adagrad/update_numerical_first_embedding/SparseApplyAdagrad"
  input: "^Adagrad/update_numerical_second_embedding/SparseApplyAdagrad"
  input: "^Adagrad/update_single_first_embedding/SparseApplyAdagrad"
  input: "^Adagrad/update_single_second_embedding/SparseApplyAdagrad"
}
node {
  name: "init"
  op: "NoOp"
  input: "^W_0/Adagrad/Assign"
  input: "^W_0/Assign"
  input: "^W_1/Adagrad/Assign"
  input: "^W_1/Assign"
  input: "^W_2/Adagrad/Assign"
  input: "^W_2/Assign"
  input: "^b_0/Adagrad/Assign"
  input: "^b_0/Assign"
  input: "^b_1/Adagrad/Assign"
  input: "^b_1/Assign"
  input: "^b_2/Adagrad/Assign"
  input: "^b_2/Assign"
  input: "^b_nn_output1/Assign"
  input: "^batch_normalization/beta/Adagrad/Assign"
  input: "^batch_normalization/beta/Assign"
  input: "^batch_normalization/gamma/Adagrad/Assign"
  input: "^batch_normalization/gamma/Assign"
  input: "^batch_normalization/moving_mean/Assign"
  input: "^batch_normalization/moving_variance/Assign"
  input: "^batch_normalization_1/beta/Adagrad/Assign"
  input: "^batch_normalization_1/beta/Assign"
  input: "^batch_normalization_1/gamma/Adagrad/Assign"
  input: "^batch_normalization_1/gamma/Assign"
  input: "^batch_normalization_1/moving_mean/Assign"
  input: "^batch_normalization_1/moving_variance/Assign"
  input: "^batch_normalization_2/beta/Adagrad/Assign"
  input: "^batch_normalization_2/beta/Assign"
  input: "^batch_normalization_2/gamma/Adagrad/Assign"
  input: "^batch_normalization_2/gamma/Assign"
  input: "^batch_normalization_2/moving_mean/Assign"
  input: "^batch_normalization_2/moving_variance/Assign"
  input: "^f_0/Assign"
  input: "^f_1/Assign"
  input: "^f_2/Assign"
  input: "^f_b0/Assign"
  input: "^f_b1/Assign"
  input: "^f_b2/Assign"
  input: "^final_b/Adagrad/Assign"
  input: "^final_b/Assign"
  input: "^final_w/Adagrad/Assign"
  input: "^final_w/Assign"
  input: "^numerical_first_embedding/Adagrad/Assign"
  input: "^numerical_first_embedding/Assign"
  input: "^numerical_second_embedding/Adagrad/Assign"
  input: "^numerical_second_embedding/Assign"
  input: "^single_first_embedding/Adagrad/Assign"
  input: "^single_first_embedding/Assign"
  input: "^single_second_embedding/Adagrad/Assign"
  input: "^single_second_embedding/Assign"
  input: "^w_nn_output1/Assign"
}
versions {
  producer: 38
}
