
K
input_1Placeholder*&
shape:ÿÿÿÿÿÿÿÿÿ  *
dtype0
Z
conv2d_1/random_uniform/shapeConst*%
valueB"             *
dtype0
H
conv2d_1/random_uniform/minConst*
valueB
 *OS¾*
dtype0
H
conv2d_1/random_uniform/maxConst*
valueB
 *OS>*
dtype0

%conv2d_1/random_uniform/RandomUniformRandomUniformconv2d_1/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2Ö¶A
e
conv2d_1/random_uniform/subSubconv2d_1/random_uniform/maxconv2d_1/random_uniform/min*
T0
o
conv2d_1/random_uniform/mulMul%conv2d_1/random_uniform/RandomUniformconv2d_1/random_uniform/sub*
T0
a
conv2d_1/random_uniformAddconv2d_1/random_uniform/mulconv2d_1/random_uniform/min*
T0
k
conv2d_1/kernel
VariableV2*
shape: *
shared_name *
dtype0*
	container 
 
conv2d_1/kernel/AssignAssignconv2d_1/kernelconv2d_1/random_uniform*
use_locking(*
T0*"
_class
loc:@conv2d_1/kernel*
validate_shape(
^
conv2d_1/kernel/readIdentityconv2d_1/kernel*
T0*"
_class
loc:@conv2d_1/kernel
8
conv2d_1/SquareSquareconv2d_1/kernel/read*
T0
;
conv2d_1/mul/xConst*
valueB
 *o:*
dtype0
=
conv2d_1/mulMulconv2d_1/mul/xconv2d_1/Square*
T0
K
conv2d_1/ConstConst*%
valueB"             *
dtype0
W
conv2d_1/SumSumconv2d_1/mulconv2d_1/Const*

Tidx0*
	keep_dims( *
T0
;
conv2d_1/add/xConst*
valueB
 *    *
dtype0
:
conv2d_1/addAddconv2d_1/add/xconv2d_1/Sum*
T0
W
"conv2d_1/convolution/dilation_rateConst*
valueB"      *
dtype0
Í
conv2d_1/convolutionConv2Dinput_1conv2d_1/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
L
batch_normalization_1/ConstConst*
valueB *  ?*
dtype0
k
batch_normalization_1/gamma
VariableV2*
shape: *
shared_name *
dtype0*
	container 
È
"batch_normalization_1/gamma/AssignAssignbatch_normalization_1/gammabatch_normalization_1/Const*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_1/gamma*
validate_shape(

 batch_normalization_1/gamma/readIdentitybatch_normalization_1/gamma*
T0*.
_class$
" loc:@batch_normalization_1/gamma
N
batch_normalization_1/Const_1Const*
valueB *    *
dtype0
j
batch_normalization_1/beta
VariableV2*
shape: *
shared_name *
dtype0*
	container 
Ç
!batch_normalization_1/beta/AssignAssignbatch_normalization_1/betabatch_normalization_1/Const_1*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_1/beta*
validate_shape(

batch_normalization_1/beta/readIdentitybatch_normalization_1/beta*
T0*-
_class#
!loc:@batch_normalization_1/beta
N
batch_normalization_1/Const_2Const*
valueB *    *
dtype0
q
!batch_normalization_1/moving_mean
VariableV2*
shape: *
shared_name *
dtype0*
	container 
Ü
(batch_normalization_1/moving_mean/AssignAssign!batch_normalization_1/moving_meanbatch_normalization_1/Const_2*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean*
validate_shape(

&batch_normalization_1/moving_mean/readIdentity!batch_normalization_1/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean
N
batch_normalization_1/Const_3Const*
valueB *  ?*
dtype0
u
%batch_normalization_1/moving_variance
VariableV2*
shape: *
shared_name *
dtype0*
	container 
è
,batch_normalization_1/moving_variance/AssignAssign%batch_normalization_1/moving_variancebatch_normalization_1/Const_3*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
validate_shape(
 
*batch_normalization_1/moving_variance/readIdentity%batch_normalization_1/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance
m
4batch_normalization_1/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

"batch_normalization_1/moments/meanMeanconv2d_1/convolution4batch_normalization_1/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
g
*batch_normalization_1/moments/StopGradientStopGradient"batch_normalization_1/moments/mean*
T0

/batch_normalization_1/moments/SquaredDifferenceSquaredDifferenceconv2d_1/convolution*batch_normalization_1/moments/StopGradient*
T0
q
8batch_normalization_1/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
¿
&batch_normalization_1/moments/varianceMean/batch_normalization_1/moments/SquaredDifference8batch_normalization_1/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
v
%batch_normalization_1/moments/SqueezeSqueeze"batch_normalization_1/moments/mean*
squeeze_dims
 *
T0
|
'batch_normalization_1/moments/Squeeze_1Squeeze&batch_normalization_1/moments/variance*
squeeze_dims
 *
T0
R
%batch_normalization_1/batchnorm/add/yConst*
valueB
 *o:*
dtype0

#batch_normalization_1/batchnorm/addAdd'batch_normalization_1/moments/Squeeze_1%batch_normalization_1/batchnorm/add/y*
T0
\
%batch_normalization_1/batchnorm/RsqrtRsqrt#batch_normalization_1/batchnorm/add*
T0
|
#batch_normalization_1/batchnorm/mulMul%batch_normalization_1/batchnorm/Rsqrt batch_normalization_1/gamma/read*
T0
p
%batch_normalization_1/batchnorm/mul_1Mulconv2d_1/convolution#batch_normalization_1/batchnorm/mul*
T0

%batch_normalization_1/batchnorm/mul_2Mul%batch_normalization_1/moments/Squeeze#batch_normalization_1/batchnorm/mul*
T0
{
#batch_normalization_1/batchnorm/subSubbatch_normalization_1/beta/read%batch_normalization_1/batchnorm/mul_2*
T0

%batch_normalization_1/batchnorm/add_1Add%batch_normalization_1/batchnorm/mul_1#batch_normalization_1/batchnorm/sub*
T0

+batch_normalization_1/AssignMovingAvg/decayConst*4
_class*
(&loc:@batch_normalization_1/moving_mean*
valueB
 *
×#<*
dtype0
¾
)batch_normalization_1/AssignMovingAvg/subSub&batch_normalization_1/moving_mean/read%batch_normalization_1/moments/Squeeze*
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean
Ç
)batch_normalization_1/AssignMovingAvg/mulMul)batch_normalization_1/AssignMovingAvg/sub+batch_normalization_1/AssignMovingAvg/decay*
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean
Ò
%batch_normalization_1/AssignMovingAvg	AssignSub!batch_normalization_1/moving_mean)batch_normalization_1/AssignMovingAvg/mul*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean

-batch_normalization_1/AssignMovingAvg_1/decayConst*8
_class.
,*loc:@batch_normalization_1/moving_variance*
valueB
 *
×#<*
dtype0
Ê
+batch_normalization_1/AssignMovingAvg_1/subSub*batch_normalization_1/moving_variance/read'batch_normalization_1/moments/Squeeze_1*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance
Ñ
+batch_normalization_1/AssignMovingAvg_1/mulMul+batch_normalization_1/AssignMovingAvg_1/sub-batch_normalization_1/AssignMovingAvg_1/decay*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance
Þ
'batch_normalization_1/AssignMovingAvg_1	AssignSub%batch_normalization_1/moving_variance+batch_normalization_1/AssignMovingAvg_1/mul*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance
U
*batch_normalization_1/keras_learning_phasePlaceholder*
shape:*
dtype0


!batch_normalization_1/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

]
#batch_normalization_1/cond/switch_tIdentity#batch_normalization_1/cond/Switch:1*
T0

[
#batch_normalization_1/cond/switch_fIdentity!batch_normalization_1/cond/Switch*
T0

c
"batch_normalization_1/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

»
#batch_normalization_1/cond/Switch_1Switch%batch_normalization_1/batchnorm/add_1"batch_normalization_1/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_1/batchnorm/add_1
}
*batch_normalization_1/cond/batchnorm/add/yConst$^batch_normalization_1/cond/switch_f*
valueB
 *o:*
dtype0
Ì
/batch_normalization_1/cond/batchnorm/add/SwitchSwitch*batch_normalization_1/moving_variance/read"batch_normalization_1/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance

(batch_normalization_1/cond/batchnorm/addAdd/batch_normalization_1/cond/batchnorm/add/Switch*batch_normalization_1/cond/batchnorm/add/y*
T0
f
*batch_normalization_1/cond/batchnorm/RsqrtRsqrt(batch_normalization_1/cond/batchnorm/add*
T0
¸
/batch_normalization_1/cond/batchnorm/mul/SwitchSwitch batch_normalization_1/gamma/read"batch_normalization_1/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_1/gamma

(batch_normalization_1/cond/batchnorm/mulMul*batch_normalization_1/cond/batchnorm/Rsqrt/batch_normalization_1/cond/batchnorm/mul/Switch*
T0
§
1batch_normalization_1/cond/batchnorm/mul_1/SwitchSwitchconv2d_1/convolution"batch_normalization_1/cond/pred_id*
T0*'
_class
loc:@conv2d_1/convolution

*batch_normalization_1/cond/batchnorm/mul_1Mul1batch_normalization_1/cond/batchnorm/mul_1/Switch(batch_normalization_1/cond/batchnorm/mul*
T0
Æ
1batch_normalization_1/cond/batchnorm/mul_2/SwitchSwitch&batch_normalization_1/moving_mean/read"batch_normalization_1/cond/pred_id*
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean

*batch_normalization_1/cond/batchnorm/mul_2Mul1batch_normalization_1/cond/batchnorm/mul_2/Switch(batch_normalization_1/cond/batchnorm/mul*
T0
¶
/batch_normalization_1/cond/batchnorm/sub/SwitchSwitchbatch_normalization_1/beta/read"batch_normalization_1/cond/pred_id*
T0*-
_class#
!loc:@batch_normalization_1/beta

(batch_normalization_1/cond/batchnorm/subSub/batch_normalization_1/cond/batchnorm/sub/Switch*batch_normalization_1/cond/batchnorm/mul_2*
T0

*batch_normalization_1/cond/batchnorm/add_1Add*batch_normalization_1/cond/batchnorm/mul_1(batch_normalization_1/cond/batchnorm/sub*
T0

 batch_normalization_1/cond/MergeMerge*batch_normalization_1/cond/batchnorm/add_1%batch_normalization_1/cond/Switch_1:1*
T0*
N
A
leakyrelu_1/NegNeg batch_normalization_1/cond/Merge*
T0
2
leakyrelu_1/ReluReluleakyrelu_1/Neg*
T0
E
leakyrelu_1/Relu_1Relu batch_normalization_1/cond/Merge*
T0
>
leakyrelu_1/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
D
leakyrelu_1/mulMulleakyrelu_1/Constleakyrelu_1/Relu*
T0
D
leakyrelu_1/subSubleakyrelu_1/Relu_1leakyrelu_1/mul*
T0

maxpooling2d_1/MaxPoolMaxPoolleakyrelu_1/sub*
ksize
*
paddingSAME*
T0*
data_formatNHWC*
strides

Z
conv2d_2/random_uniform/shapeConst*%
valueB"          @   *
dtype0
H
conv2d_2/random_uniform/minConst*
valueB
 *«ªª½*
dtype0
H
conv2d_2/random_uniform/maxConst*
valueB
 *«ªª=*
dtype0

%conv2d_2/random_uniform/RandomUniformRandomUniformconv2d_2/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2±¸¹
e
conv2d_2/random_uniform/subSubconv2d_2/random_uniform/maxconv2d_2/random_uniform/min*
T0
o
conv2d_2/random_uniform/mulMul%conv2d_2/random_uniform/RandomUniformconv2d_2/random_uniform/sub*
T0
a
conv2d_2/random_uniformAddconv2d_2/random_uniform/mulconv2d_2/random_uniform/min*
T0
k
conv2d_2/kernel
VariableV2*
shape: @*
shared_name *
dtype0*
	container 
 
conv2d_2/kernel/AssignAssignconv2d_2/kernelconv2d_2/random_uniform*
use_locking(*
T0*"
_class
loc:@conv2d_2/kernel*
validate_shape(
^
conv2d_2/kernel/readIdentityconv2d_2/kernel*
T0*"
_class
loc:@conv2d_2/kernel
8
conv2d_2/SquareSquareconv2d_2/kernel/read*
T0
;
conv2d_2/mul/xConst*
valueB
 *o:*
dtype0
=
conv2d_2/mulMulconv2d_2/mul/xconv2d_2/Square*
T0
K
conv2d_2/ConstConst*%
valueB"             *
dtype0
W
conv2d_2/SumSumconv2d_2/mulconv2d_2/Const*

Tidx0*
	keep_dims( *
T0
;
conv2d_2/add/xConst*
valueB
 *    *
dtype0
:
conv2d_2/addAddconv2d_2/add/xconv2d_2/Sum*
T0
W
"conv2d_2/convolution/dilation_rateConst*
valueB"      *
dtype0
Ü
conv2d_2/convolutionConv2Dmaxpooling2d_1/MaxPoolconv2d_2/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
L
batch_normalization_2/ConstConst*
valueB@*  ?*
dtype0
k
batch_normalization_2/gamma
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
È
"batch_normalization_2/gamma/AssignAssignbatch_normalization_2/gammabatch_normalization_2/Const*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_2/gamma*
validate_shape(

 batch_normalization_2/gamma/readIdentitybatch_normalization_2/gamma*
T0*.
_class$
" loc:@batch_normalization_2/gamma
N
batch_normalization_2/Const_1Const*
valueB@*    *
dtype0
j
batch_normalization_2/beta
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
Ç
!batch_normalization_2/beta/AssignAssignbatch_normalization_2/betabatch_normalization_2/Const_1*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_2/beta*
validate_shape(

batch_normalization_2/beta/readIdentitybatch_normalization_2/beta*
T0*-
_class#
!loc:@batch_normalization_2/beta
N
batch_normalization_2/Const_2Const*
valueB@*    *
dtype0
q
!batch_normalization_2/moving_mean
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
Ü
(batch_normalization_2/moving_mean/AssignAssign!batch_normalization_2/moving_meanbatch_normalization_2/Const_2*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean*
validate_shape(

&batch_normalization_2/moving_mean/readIdentity!batch_normalization_2/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean
N
batch_normalization_2/Const_3Const*
valueB@*  ?*
dtype0
u
%batch_normalization_2/moving_variance
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
è
,batch_normalization_2/moving_variance/AssignAssign%batch_normalization_2/moving_variancebatch_normalization_2/Const_3*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance*
validate_shape(
 
*batch_normalization_2/moving_variance/readIdentity%batch_normalization_2/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance
m
4batch_normalization_2/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

"batch_normalization_2/moments/meanMeanconv2d_2/convolution4batch_normalization_2/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
g
*batch_normalization_2/moments/StopGradientStopGradient"batch_normalization_2/moments/mean*
T0

/batch_normalization_2/moments/SquaredDifferenceSquaredDifferenceconv2d_2/convolution*batch_normalization_2/moments/StopGradient*
T0
q
8batch_normalization_2/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
¿
&batch_normalization_2/moments/varianceMean/batch_normalization_2/moments/SquaredDifference8batch_normalization_2/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
v
%batch_normalization_2/moments/SqueezeSqueeze"batch_normalization_2/moments/mean*
squeeze_dims
 *
T0
|
'batch_normalization_2/moments/Squeeze_1Squeeze&batch_normalization_2/moments/variance*
squeeze_dims
 *
T0
R
%batch_normalization_2/batchnorm/add/yConst*
valueB
 *o:*
dtype0

#batch_normalization_2/batchnorm/addAdd'batch_normalization_2/moments/Squeeze_1%batch_normalization_2/batchnorm/add/y*
T0
\
%batch_normalization_2/batchnorm/RsqrtRsqrt#batch_normalization_2/batchnorm/add*
T0
|
#batch_normalization_2/batchnorm/mulMul%batch_normalization_2/batchnorm/Rsqrt batch_normalization_2/gamma/read*
T0
p
%batch_normalization_2/batchnorm/mul_1Mulconv2d_2/convolution#batch_normalization_2/batchnorm/mul*
T0

%batch_normalization_2/batchnorm/mul_2Mul%batch_normalization_2/moments/Squeeze#batch_normalization_2/batchnorm/mul*
T0
{
#batch_normalization_2/batchnorm/subSubbatch_normalization_2/beta/read%batch_normalization_2/batchnorm/mul_2*
T0

%batch_normalization_2/batchnorm/add_1Add%batch_normalization_2/batchnorm/mul_1#batch_normalization_2/batchnorm/sub*
T0

+batch_normalization_2/AssignMovingAvg/decayConst*4
_class*
(&loc:@batch_normalization_2/moving_mean*
valueB
 *
×#<*
dtype0
¾
)batch_normalization_2/AssignMovingAvg/subSub&batch_normalization_2/moving_mean/read%batch_normalization_2/moments/Squeeze*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean
Ç
)batch_normalization_2/AssignMovingAvg/mulMul)batch_normalization_2/AssignMovingAvg/sub+batch_normalization_2/AssignMovingAvg/decay*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean
Ò
%batch_normalization_2/AssignMovingAvg	AssignSub!batch_normalization_2/moving_mean)batch_normalization_2/AssignMovingAvg/mul*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean

-batch_normalization_2/AssignMovingAvg_1/decayConst*8
_class.
,*loc:@batch_normalization_2/moving_variance*
valueB
 *
×#<*
dtype0
Ê
+batch_normalization_2/AssignMovingAvg_1/subSub*batch_normalization_2/moving_variance/read'batch_normalization_2/moments/Squeeze_1*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance
Ñ
+batch_normalization_2/AssignMovingAvg_1/mulMul+batch_normalization_2/AssignMovingAvg_1/sub-batch_normalization_2/AssignMovingAvg_1/decay*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance
Þ
'batch_normalization_2/AssignMovingAvg_1	AssignSub%batch_normalization_2/moving_variance+batch_normalization_2/AssignMovingAvg_1/mul*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance

!batch_normalization_2/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

]
#batch_normalization_2/cond/switch_tIdentity#batch_normalization_2/cond/Switch:1*
T0

[
#batch_normalization_2/cond/switch_fIdentity!batch_normalization_2/cond/Switch*
T0

c
"batch_normalization_2/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

»
#batch_normalization_2/cond/Switch_1Switch%batch_normalization_2/batchnorm/add_1"batch_normalization_2/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_2/batchnorm/add_1
}
*batch_normalization_2/cond/batchnorm/add/yConst$^batch_normalization_2/cond/switch_f*
valueB
 *o:*
dtype0
Ì
/batch_normalization_2/cond/batchnorm/add/SwitchSwitch*batch_normalization_2/moving_variance/read"batch_normalization_2/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance

(batch_normalization_2/cond/batchnorm/addAdd/batch_normalization_2/cond/batchnorm/add/Switch*batch_normalization_2/cond/batchnorm/add/y*
T0
f
*batch_normalization_2/cond/batchnorm/RsqrtRsqrt(batch_normalization_2/cond/batchnorm/add*
T0
¸
/batch_normalization_2/cond/batchnorm/mul/SwitchSwitch batch_normalization_2/gamma/read"batch_normalization_2/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_2/gamma

(batch_normalization_2/cond/batchnorm/mulMul*batch_normalization_2/cond/batchnorm/Rsqrt/batch_normalization_2/cond/batchnorm/mul/Switch*
T0
§
1batch_normalization_2/cond/batchnorm/mul_1/SwitchSwitchconv2d_2/convolution"batch_normalization_2/cond/pred_id*
T0*'
_class
loc:@conv2d_2/convolution

*batch_normalization_2/cond/batchnorm/mul_1Mul1batch_normalization_2/cond/batchnorm/mul_1/Switch(batch_normalization_2/cond/batchnorm/mul*
T0
Æ
1batch_normalization_2/cond/batchnorm/mul_2/SwitchSwitch&batch_normalization_2/moving_mean/read"batch_normalization_2/cond/pred_id*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean

*batch_normalization_2/cond/batchnorm/mul_2Mul1batch_normalization_2/cond/batchnorm/mul_2/Switch(batch_normalization_2/cond/batchnorm/mul*
T0
¶
/batch_normalization_2/cond/batchnorm/sub/SwitchSwitchbatch_normalization_2/beta/read"batch_normalization_2/cond/pred_id*
T0*-
_class#
!loc:@batch_normalization_2/beta

(batch_normalization_2/cond/batchnorm/subSub/batch_normalization_2/cond/batchnorm/sub/Switch*batch_normalization_2/cond/batchnorm/mul_2*
T0

*batch_normalization_2/cond/batchnorm/add_1Add*batch_normalization_2/cond/batchnorm/mul_1(batch_normalization_2/cond/batchnorm/sub*
T0

 batch_normalization_2/cond/MergeMerge*batch_normalization_2/cond/batchnorm/add_1%batch_normalization_2/cond/Switch_1:1*
T0*
N
A
leakyrelu_2/NegNeg batch_normalization_2/cond/Merge*
T0
2
leakyrelu_2/ReluReluleakyrelu_2/Neg*
T0
E
leakyrelu_2/Relu_1Relu batch_normalization_2/cond/Merge*
T0
>
leakyrelu_2/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
D
leakyrelu_2/mulMulleakyrelu_2/Constleakyrelu_2/Relu*
T0
D
leakyrelu_2/subSubleakyrelu_2/Relu_1leakyrelu_2/mul*
T0

maxpooling2d_2/MaxPoolMaxPoolleakyrelu_2/sub*
ksize
*
paddingSAME*
T0*
data_formatNHWC*
strides

Z
conv2d_3/random_uniform/shapeConst*%
valueB"      @      *
dtype0
H
conv2d_3/random_uniform/minConst*
valueB
 *ï[q½*
dtype0
H
conv2d_3/random_uniform/maxConst*
valueB
 *ï[q=*
dtype0

%conv2d_3/random_uniform/RandomUniformRandomUniformconv2d_3/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2È§¾
e
conv2d_3/random_uniform/subSubconv2d_3/random_uniform/maxconv2d_3/random_uniform/min*
T0
o
conv2d_3/random_uniform/mulMul%conv2d_3/random_uniform/RandomUniformconv2d_3/random_uniform/sub*
T0
a
conv2d_3/random_uniformAddconv2d_3/random_uniform/mulconv2d_3/random_uniform/min*
T0
l
conv2d_3/kernel
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
 
conv2d_3/kernel/AssignAssignconv2d_3/kernelconv2d_3/random_uniform*
use_locking(*
T0*"
_class
loc:@conv2d_3/kernel*
validate_shape(
^
conv2d_3/kernel/readIdentityconv2d_3/kernel*
T0*"
_class
loc:@conv2d_3/kernel
8
conv2d_3/SquareSquareconv2d_3/kernel/read*
T0
;
conv2d_3/mul/xConst*
valueB
 *o:*
dtype0
=
conv2d_3/mulMulconv2d_3/mul/xconv2d_3/Square*
T0
K
conv2d_3/ConstConst*%
valueB"             *
dtype0
W
conv2d_3/SumSumconv2d_3/mulconv2d_3/Const*

Tidx0*
	keep_dims( *
T0
;
conv2d_3/add/xConst*
valueB
 *    *
dtype0
:
conv2d_3/addAddconv2d_3/add/xconv2d_3/Sum*
T0
W
"conv2d_3/convolution/dilation_rateConst*
valueB"      *
dtype0
Ü
conv2d_3/convolutionConv2Dmaxpooling2d_2/MaxPoolconv2d_3/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
M
batch_normalization_3/ConstConst*
valueB*  ?*
dtype0
l
batch_normalization_3/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
È
"batch_normalization_3/gamma/AssignAssignbatch_normalization_3/gammabatch_normalization_3/Const*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_3/gamma*
validate_shape(

 batch_normalization_3/gamma/readIdentitybatch_normalization_3/gamma*
T0*.
_class$
" loc:@batch_normalization_3/gamma
O
batch_normalization_3/Const_1Const*
valueB*    *
dtype0
k
batch_normalization_3/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ç
!batch_normalization_3/beta/AssignAssignbatch_normalization_3/betabatch_normalization_3/Const_1*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_3/beta*
validate_shape(

batch_normalization_3/beta/readIdentitybatch_normalization_3/beta*
T0*-
_class#
!loc:@batch_normalization_3/beta
O
batch_normalization_3/Const_2Const*
valueB*    *
dtype0
r
!batch_normalization_3/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ü
(batch_normalization_3/moving_mean/AssignAssign!batch_normalization_3/moving_meanbatch_normalization_3/Const_2*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean*
validate_shape(

&batch_normalization_3/moving_mean/readIdentity!batch_normalization_3/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean
O
batch_normalization_3/Const_3Const*
valueB*  ?*
dtype0
v
%batch_normalization_3/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
è
,batch_normalization_3/moving_variance/AssignAssign%batch_normalization_3/moving_variancebatch_normalization_3/Const_3*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance*
validate_shape(
 
*batch_normalization_3/moving_variance/readIdentity%batch_normalization_3/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance
m
4batch_normalization_3/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

"batch_normalization_3/moments/meanMeanconv2d_3/convolution4batch_normalization_3/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
g
*batch_normalization_3/moments/StopGradientStopGradient"batch_normalization_3/moments/mean*
T0

/batch_normalization_3/moments/SquaredDifferenceSquaredDifferenceconv2d_3/convolution*batch_normalization_3/moments/StopGradient*
T0
q
8batch_normalization_3/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
¿
&batch_normalization_3/moments/varianceMean/batch_normalization_3/moments/SquaredDifference8batch_normalization_3/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
v
%batch_normalization_3/moments/SqueezeSqueeze"batch_normalization_3/moments/mean*
squeeze_dims
 *
T0
|
'batch_normalization_3/moments/Squeeze_1Squeeze&batch_normalization_3/moments/variance*
squeeze_dims
 *
T0
R
%batch_normalization_3/batchnorm/add/yConst*
valueB
 *o:*
dtype0

#batch_normalization_3/batchnorm/addAdd'batch_normalization_3/moments/Squeeze_1%batch_normalization_3/batchnorm/add/y*
T0
\
%batch_normalization_3/batchnorm/RsqrtRsqrt#batch_normalization_3/batchnorm/add*
T0
|
#batch_normalization_3/batchnorm/mulMul%batch_normalization_3/batchnorm/Rsqrt batch_normalization_3/gamma/read*
T0
p
%batch_normalization_3/batchnorm/mul_1Mulconv2d_3/convolution#batch_normalization_3/batchnorm/mul*
T0

%batch_normalization_3/batchnorm/mul_2Mul%batch_normalization_3/moments/Squeeze#batch_normalization_3/batchnorm/mul*
T0
{
#batch_normalization_3/batchnorm/subSubbatch_normalization_3/beta/read%batch_normalization_3/batchnorm/mul_2*
T0

%batch_normalization_3/batchnorm/add_1Add%batch_normalization_3/batchnorm/mul_1#batch_normalization_3/batchnorm/sub*
T0

+batch_normalization_3/AssignMovingAvg/decayConst*4
_class*
(&loc:@batch_normalization_3/moving_mean*
valueB
 *
×#<*
dtype0
¾
)batch_normalization_3/AssignMovingAvg/subSub&batch_normalization_3/moving_mean/read%batch_normalization_3/moments/Squeeze*
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean
Ç
)batch_normalization_3/AssignMovingAvg/mulMul)batch_normalization_3/AssignMovingAvg/sub+batch_normalization_3/AssignMovingAvg/decay*
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean
Ò
%batch_normalization_3/AssignMovingAvg	AssignSub!batch_normalization_3/moving_mean)batch_normalization_3/AssignMovingAvg/mul*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean

-batch_normalization_3/AssignMovingAvg_1/decayConst*8
_class.
,*loc:@batch_normalization_3/moving_variance*
valueB
 *
×#<*
dtype0
Ê
+batch_normalization_3/AssignMovingAvg_1/subSub*batch_normalization_3/moving_variance/read'batch_normalization_3/moments/Squeeze_1*
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance
Ñ
+batch_normalization_3/AssignMovingAvg_1/mulMul+batch_normalization_3/AssignMovingAvg_1/sub-batch_normalization_3/AssignMovingAvg_1/decay*
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance
Þ
'batch_normalization_3/AssignMovingAvg_1	AssignSub%batch_normalization_3/moving_variance+batch_normalization_3/AssignMovingAvg_1/mul*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance

!batch_normalization_3/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

]
#batch_normalization_3/cond/switch_tIdentity#batch_normalization_3/cond/Switch:1*
T0

[
#batch_normalization_3/cond/switch_fIdentity!batch_normalization_3/cond/Switch*
T0

c
"batch_normalization_3/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

»
#batch_normalization_3/cond/Switch_1Switch%batch_normalization_3/batchnorm/add_1"batch_normalization_3/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_3/batchnorm/add_1
}
*batch_normalization_3/cond/batchnorm/add/yConst$^batch_normalization_3/cond/switch_f*
valueB
 *o:*
dtype0
Ì
/batch_normalization_3/cond/batchnorm/add/SwitchSwitch*batch_normalization_3/moving_variance/read"batch_normalization_3/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance

(batch_normalization_3/cond/batchnorm/addAdd/batch_normalization_3/cond/batchnorm/add/Switch*batch_normalization_3/cond/batchnorm/add/y*
T0
f
*batch_normalization_3/cond/batchnorm/RsqrtRsqrt(batch_normalization_3/cond/batchnorm/add*
T0
¸
/batch_normalization_3/cond/batchnorm/mul/SwitchSwitch batch_normalization_3/gamma/read"batch_normalization_3/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_3/gamma

(batch_normalization_3/cond/batchnorm/mulMul*batch_normalization_3/cond/batchnorm/Rsqrt/batch_normalization_3/cond/batchnorm/mul/Switch*
T0
§
1batch_normalization_3/cond/batchnorm/mul_1/SwitchSwitchconv2d_3/convolution"batch_normalization_3/cond/pred_id*
T0*'
_class
loc:@conv2d_3/convolution

*batch_normalization_3/cond/batchnorm/mul_1Mul1batch_normalization_3/cond/batchnorm/mul_1/Switch(batch_normalization_3/cond/batchnorm/mul*
T0
Æ
1batch_normalization_3/cond/batchnorm/mul_2/SwitchSwitch&batch_normalization_3/moving_mean/read"batch_normalization_3/cond/pred_id*
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean

*batch_normalization_3/cond/batchnorm/mul_2Mul1batch_normalization_3/cond/batchnorm/mul_2/Switch(batch_normalization_3/cond/batchnorm/mul*
T0
¶
/batch_normalization_3/cond/batchnorm/sub/SwitchSwitchbatch_normalization_3/beta/read"batch_normalization_3/cond/pred_id*
T0*-
_class#
!loc:@batch_normalization_3/beta

(batch_normalization_3/cond/batchnorm/subSub/batch_normalization_3/cond/batchnorm/sub/Switch*batch_normalization_3/cond/batchnorm/mul_2*
T0

*batch_normalization_3/cond/batchnorm/add_1Add*batch_normalization_3/cond/batchnorm/mul_1(batch_normalization_3/cond/batchnorm/sub*
T0

 batch_normalization_3/cond/MergeMerge*batch_normalization_3/cond/batchnorm/add_1%batch_normalization_3/cond/Switch_1:1*
T0*
N
A
leakyrelu_3/NegNeg batch_normalization_3/cond/Merge*
T0
2
leakyrelu_3/ReluReluleakyrelu_3/Neg*
T0
E
leakyrelu_3/Relu_1Relu batch_normalization_3/cond/Merge*
T0
>
leakyrelu_3/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
D
leakyrelu_3/mulMulleakyrelu_3/Constleakyrelu_3/Relu*
T0
D
leakyrelu_3/subSubleakyrelu_3/Relu_1leakyrelu_3/mul*
T0
Z
conv2d_4/random_uniform/shapeConst*%
valueB"         @   *
dtype0
H
conv2d_4/random_uniform/minConst*
valueB
 *ó5¾*
dtype0
H
conv2d_4/random_uniform/maxConst*
valueB
 *ó5>*
dtype0

%conv2d_4/random_uniform/RandomUniformRandomUniformconv2d_4/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2ã¦ð
e
conv2d_4/random_uniform/subSubconv2d_4/random_uniform/maxconv2d_4/random_uniform/min*
T0
o
conv2d_4/random_uniform/mulMul%conv2d_4/random_uniform/RandomUniformconv2d_4/random_uniform/sub*
T0
a
conv2d_4/random_uniformAddconv2d_4/random_uniform/mulconv2d_4/random_uniform/min*
T0
l
conv2d_4/kernel
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
 
conv2d_4/kernel/AssignAssignconv2d_4/kernelconv2d_4/random_uniform*
use_locking(*
T0*"
_class
loc:@conv2d_4/kernel*
validate_shape(
^
conv2d_4/kernel/readIdentityconv2d_4/kernel*
T0*"
_class
loc:@conv2d_4/kernel
8
conv2d_4/SquareSquareconv2d_4/kernel/read*
T0
;
conv2d_4/mul/xConst*
valueB
 *o:*
dtype0
=
conv2d_4/mulMulconv2d_4/mul/xconv2d_4/Square*
T0
K
conv2d_4/ConstConst*%
valueB"             *
dtype0
W
conv2d_4/SumSumconv2d_4/mulconv2d_4/Const*

Tidx0*
	keep_dims( *
T0
;
conv2d_4/add/xConst*
valueB
 *    *
dtype0
:
conv2d_4/addAddconv2d_4/add/xconv2d_4/Sum*
T0
W
"conv2d_4/convolution/dilation_rateConst*
valueB"      *
dtype0
Õ
conv2d_4/convolutionConv2Dleakyrelu_3/subconv2d_4/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
L
batch_normalization_4/ConstConst*
valueB@*  ?*
dtype0
k
batch_normalization_4/gamma
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
È
"batch_normalization_4/gamma/AssignAssignbatch_normalization_4/gammabatch_normalization_4/Const*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_4/gamma*
validate_shape(

 batch_normalization_4/gamma/readIdentitybatch_normalization_4/gamma*
T0*.
_class$
" loc:@batch_normalization_4/gamma
N
batch_normalization_4/Const_1Const*
valueB@*    *
dtype0
j
batch_normalization_4/beta
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
Ç
!batch_normalization_4/beta/AssignAssignbatch_normalization_4/betabatch_normalization_4/Const_1*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_4/beta*
validate_shape(

batch_normalization_4/beta/readIdentitybatch_normalization_4/beta*
T0*-
_class#
!loc:@batch_normalization_4/beta
N
batch_normalization_4/Const_2Const*
valueB@*    *
dtype0
q
!batch_normalization_4/moving_mean
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
Ü
(batch_normalization_4/moving_mean/AssignAssign!batch_normalization_4/moving_meanbatch_normalization_4/Const_2*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_4/moving_mean*
validate_shape(

&batch_normalization_4/moving_mean/readIdentity!batch_normalization_4/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_4/moving_mean
N
batch_normalization_4/Const_3Const*
valueB@*  ?*
dtype0
u
%batch_normalization_4/moving_variance
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
è
,batch_normalization_4/moving_variance/AssignAssign%batch_normalization_4/moving_variancebatch_normalization_4/Const_3*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_4/moving_variance*
validate_shape(
 
*batch_normalization_4/moving_variance/readIdentity%batch_normalization_4/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_4/moving_variance
m
4batch_normalization_4/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

"batch_normalization_4/moments/meanMeanconv2d_4/convolution4batch_normalization_4/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
g
*batch_normalization_4/moments/StopGradientStopGradient"batch_normalization_4/moments/mean*
T0

/batch_normalization_4/moments/SquaredDifferenceSquaredDifferenceconv2d_4/convolution*batch_normalization_4/moments/StopGradient*
T0
q
8batch_normalization_4/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
¿
&batch_normalization_4/moments/varianceMean/batch_normalization_4/moments/SquaredDifference8batch_normalization_4/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
v
%batch_normalization_4/moments/SqueezeSqueeze"batch_normalization_4/moments/mean*
squeeze_dims
 *
T0
|
'batch_normalization_4/moments/Squeeze_1Squeeze&batch_normalization_4/moments/variance*
squeeze_dims
 *
T0
R
%batch_normalization_4/batchnorm/add/yConst*
valueB
 *o:*
dtype0

#batch_normalization_4/batchnorm/addAdd'batch_normalization_4/moments/Squeeze_1%batch_normalization_4/batchnorm/add/y*
T0
\
%batch_normalization_4/batchnorm/RsqrtRsqrt#batch_normalization_4/batchnorm/add*
T0
|
#batch_normalization_4/batchnorm/mulMul%batch_normalization_4/batchnorm/Rsqrt batch_normalization_4/gamma/read*
T0
p
%batch_normalization_4/batchnorm/mul_1Mulconv2d_4/convolution#batch_normalization_4/batchnorm/mul*
T0

%batch_normalization_4/batchnorm/mul_2Mul%batch_normalization_4/moments/Squeeze#batch_normalization_4/batchnorm/mul*
T0
{
#batch_normalization_4/batchnorm/subSubbatch_normalization_4/beta/read%batch_normalization_4/batchnorm/mul_2*
T0

%batch_normalization_4/batchnorm/add_1Add%batch_normalization_4/batchnorm/mul_1#batch_normalization_4/batchnorm/sub*
T0

+batch_normalization_4/AssignMovingAvg/decayConst*4
_class*
(&loc:@batch_normalization_4/moving_mean*
valueB
 *
×#<*
dtype0
¾
)batch_normalization_4/AssignMovingAvg/subSub&batch_normalization_4/moving_mean/read%batch_normalization_4/moments/Squeeze*
T0*4
_class*
(&loc:@batch_normalization_4/moving_mean
Ç
)batch_normalization_4/AssignMovingAvg/mulMul)batch_normalization_4/AssignMovingAvg/sub+batch_normalization_4/AssignMovingAvg/decay*
T0*4
_class*
(&loc:@batch_normalization_4/moving_mean
Ò
%batch_normalization_4/AssignMovingAvg	AssignSub!batch_normalization_4/moving_mean)batch_normalization_4/AssignMovingAvg/mul*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_4/moving_mean

-batch_normalization_4/AssignMovingAvg_1/decayConst*8
_class.
,*loc:@batch_normalization_4/moving_variance*
valueB
 *
×#<*
dtype0
Ê
+batch_normalization_4/AssignMovingAvg_1/subSub*batch_normalization_4/moving_variance/read'batch_normalization_4/moments/Squeeze_1*
T0*8
_class.
,*loc:@batch_normalization_4/moving_variance
Ñ
+batch_normalization_4/AssignMovingAvg_1/mulMul+batch_normalization_4/AssignMovingAvg_1/sub-batch_normalization_4/AssignMovingAvg_1/decay*
T0*8
_class.
,*loc:@batch_normalization_4/moving_variance
Þ
'batch_normalization_4/AssignMovingAvg_1	AssignSub%batch_normalization_4/moving_variance+batch_normalization_4/AssignMovingAvg_1/mul*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_4/moving_variance

!batch_normalization_4/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

]
#batch_normalization_4/cond/switch_tIdentity#batch_normalization_4/cond/Switch:1*
T0

[
#batch_normalization_4/cond/switch_fIdentity!batch_normalization_4/cond/Switch*
T0

c
"batch_normalization_4/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

»
#batch_normalization_4/cond/Switch_1Switch%batch_normalization_4/batchnorm/add_1"batch_normalization_4/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_4/batchnorm/add_1
}
*batch_normalization_4/cond/batchnorm/add/yConst$^batch_normalization_4/cond/switch_f*
valueB
 *o:*
dtype0
Ì
/batch_normalization_4/cond/batchnorm/add/SwitchSwitch*batch_normalization_4/moving_variance/read"batch_normalization_4/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_4/moving_variance

(batch_normalization_4/cond/batchnorm/addAdd/batch_normalization_4/cond/batchnorm/add/Switch*batch_normalization_4/cond/batchnorm/add/y*
T0
f
*batch_normalization_4/cond/batchnorm/RsqrtRsqrt(batch_normalization_4/cond/batchnorm/add*
T0
¸
/batch_normalization_4/cond/batchnorm/mul/SwitchSwitch batch_normalization_4/gamma/read"batch_normalization_4/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_4/gamma

(batch_normalization_4/cond/batchnorm/mulMul*batch_normalization_4/cond/batchnorm/Rsqrt/batch_normalization_4/cond/batchnorm/mul/Switch*
T0
§
1batch_normalization_4/cond/batchnorm/mul_1/SwitchSwitchconv2d_4/convolution"batch_normalization_4/cond/pred_id*
T0*'
_class
loc:@conv2d_4/convolution

*batch_normalization_4/cond/batchnorm/mul_1Mul1batch_normalization_4/cond/batchnorm/mul_1/Switch(batch_normalization_4/cond/batchnorm/mul*
T0
Æ
1batch_normalization_4/cond/batchnorm/mul_2/SwitchSwitch&batch_normalization_4/moving_mean/read"batch_normalization_4/cond/pred_id*
T0*4
_class*
(&loc:@batch_normalization_4/moving_mean

*batch_normalization_4/cond/batchnorm/mul_2Mul1batch_normalization_4/cond/batchnorm/mul_2/Switch(batch_normalization_4/cond/batchnorm/mul*
T0
¶
/batch_normalization_4/cond/batchnorm/sub/SwitchSwitchbatch_normalization_4/beta/read"batch_normalization_4/cond/pred_id*
T0*-
_class#
!loc:@batch_normalization_4/beta

(batch_normalization_4/cond/batchnorm/subSub/batch_normalization_4/cond/batchnorm/sub/Switch*batch_normalization_4/cond/batchnorm/mul_2*
T0

*batch_normalization_4/cond/batchnorm/add_1Add*batch_normalization_4/cond/batchnorm/mul_1(batch_normalization_4/cond/batchnorm/sub*
T0

 batch_normalization_4/cond/MergeMerge*batch_normalization_4/cond/batchnorm/add_1%batch_normalization_4/cond/Switch_1:1*
T0*
N
A
leakyrelu_4/NegNeg batch_normalization_4/cond/Merge*
T0
2
leakyrelu_4/ReluReluleakyrelu_4/Neg*
T0
E
leakyrelu_4/Relu_1Relu batch_normalization_4/cond/Merge*
T0
>
leakyrelu_4/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
D
leakyrelu_4/mulMulleakyrelu_4/Constleakyrelu_4/Relu*
T0
D
leakyrelu_4/subSubleakyrelu_4/Relu_1leakyrelu_4/mul*
T0
Z
conv2d_5/random_uniform/shapeConst*%
valueB"      @      *
dtype0
H
conv2d_5/random_uniform/minConst*
valueB
 *ï[q½*
dtype0
H
conv2d_5/random_uniform/maxConst*
valueB
 *ï[q=*
dtype0

%conv2d_5/random_uniform/RandomUniformRandomUniformconv2d_5/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2 í
e
conv2d_5/random_uniform/subSubconv2d_5/random_uniform/maxconv2d_5/random_uniform/min*
T0
o
conv2d_5/random_uniform/mulMul%conv2d_5/random_uniform/RandomUniformconv2d_5/random_uniform/sub*
T0
a
conv2d_5/random_uniformAddconv2d_5/random_uniform/mulconv2d_5/random_uniform/min*
T0
l
conv2d_5/kernel
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
 
conv2d_5/kernel/AssignAssignconv2d_5/kernelconv2d_5/random_uniform*
use_locking(*
T0*"
_class
loc:@conv2d_5/kernel*
validate_shape(
^
conv2d_5/kernel/readIdentityconv2d_5/kernel*
T0*"
_class
loc:@conv2d_5/kernel
8
conv2d_5/SquareSquareconv2d_5/kernel/read*
T0
;
conv2d_5/mul/xConst*
valueB
 *o:*
dtype0
=
conv2d_5/mulMulconv2d_5/mul/xconv2d_5/Square*
T0
K
conv2d_5/ConstConst*%
valueB"             *
dtype0
W
conv2d_5/SumSumconv2d_5/mulconv2d_5/Const*

Tidx0*
	keep_dims( *
T0
;
conv2d_5/add/xConst*
valueB
 *    *
dtype0
:
conv2d_5/addAddconv2d_5/add/xconv2d_5/Sum*
T0
W
"conv2d_5/convolution/dilation_rateConst*
valueB"      *
dtype0
Õ
conv2d_5/convolutionConv2Dleakyrelu_4/subconv2d_5/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
M
batch_normalization_5/ConstConst*
valueB*  ?*
dtype0
l
batch_normalization_5/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
È
"batch_normalization_5/gamma/AssignAssignbatch_normalization_5/gammabatch_normalization_5/Const*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_5/gamma*
validate_shape(

 batch_normalization_5/gamma/readIdentitybatch_normalization_5/gamma*
T0*.
_class$
" loc:@batch_normalization_5/gamma
O
batch_normalization_5/Const_1Const*
valueB*    *
dtype0
k
batch_normalization_5/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ç
!batch_normalization_5/beta/AssignAssignbatch_normalization_5/betabatch_normalization_5/Const_1*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_5/beta*
validate_shape(

batch_normalization_5/beta/readIdentitybatch_normalization_5/beta*
T0*-
_class#
!loc:@batch_normalization_5/beta
O
batch_normalization_5/Const_2Const*
valueB*    *
dtype0
r
!batch_normalization_5/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ü
(batch_normalization_5/moving_mean/AssignAssign!batch_normalization_5/moving_meanbatch_normalization_5/Const_2*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_5/moving_mean*
validate_shape(

&batch_normalization_5/moving_mean/readIdentity!batch_normalization_5/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_5/moving_mean
O
batch_normalization_5/Const_3Const*
valueB*  ?*
dtype0
v
%batch_normalization_5/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
è
,batch_normalization_5/moving_variance/AssignAssign%batch_normalization_5/moving_variancebatch_normalization_5/Const_3*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_5/moving_variance*
validate_shape(
 
*batch_normalization_5/moving_variance/readIdentity%batch_normalization_5/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_5/moving_variance
m
4batch_normalization_5/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

"batch_normalization_5/moments/meanMeanconv2d_5/convolution4batch_normalization_5/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
g
*batch_normalization_5/moments/StopGradientStopGradient"batch_normalization_5/moments/mean*
T0

/batch_normalization_5/moments/SquaredDifferenceSquaredDifferenceconv2d_5/convolution*batch_normalization_5/moments/StopGradient*
T0
q
8batch_normalization_5/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
¿
&batch_normalization_5/moments/varianceMean/batch_normalization_5/moments/SquaredDifference8batch_normalization_5/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
v
%batch_normalization_5/moments/SqueezeSqueeze"batch_normalization_5/moments/mean*
squeeze_dims
 *
T0
|
'batch_normalization_5/moments/Squeeze_1Squeeze&batch_normalization_5/moments/variance*
squeeze_dims
 *
T0
R
%batch_normalization_5/batchnorm/add/yConst*
valueB
 *o:*
dtype0

#batch_normalization_5/batchnorm/addAdd'batch_normalization_5/moments/Squeeze_1%batch_normalization_5/batchnorm/add/y*
T0
\
%batch_normalization_5/batchnorm/RsqrtRsqrt#batch_normalization_5/batchnorm/add*
T0
|
#batch_normalization_5/batchnorm/mulMul%batch_normalization_5/batchnorm/Rsqrt batch_normalization_5/gamma/read*
T0
p
%batch_normalization_5/batchnorm/mul_1Mulconv2d_5/convolution#batch_normalization_5/batchnorm/mul*
T0

%batch_normalization_5/batchnorm/mul_2Mul%batch_normalization_5/moments/Squeeze#batch_normalization_5/batchnorm/mul*
T0
{
#batch_normalization_5/batchnorm/subSubbatch_normalization_5/beta/read%batch_normalization_5/batchnorm/mul_2*
T0

%batch_normalization_5/batchnorm/add_1Add%batch_normalization_5/batchnorm/mul_1#batch_normalization_5/batchnorm/sub*
T0

+batch_normalization_5/AssignMovingAvg/decayConst*4
_class*
(&loc:@batch_normalization_5/moving_mean*
valueB
 *
×#<*
dtype0
¾
)batch_normalization_5/AssignMovingAvg/subSub&batch_normalization_5/moving_mean/read%batch_normalization_5/moments/Squeeze*
T0*4
_class*
(&loc:@batch_normalization_5/moving_mean
Ç
)batch_normalization_5/AssignMovingAvg/mulMul)batch_normalization_5/AssignMovingAvg/sub+batch_normalization_5/AssignMovingAvg/decay*
T0*4
_class*
(&loc:@batch_normalization_5/moving_mean
Ò
%batch_normalization_5/AssignMovingAvg	AssignSub!batch_normalization_5/moving_mean)batch_normalization_5/AssignMovingAvg/mul*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_5/moving_mean

-batch_normalization_5/AssignMovingAvg_1/decayConst*8
_class.
,*loc:@batch_normalization_5/moving_variance*
valueB
 *
×#<*
dtype0
Ê
+batch_normalization_5/AssignMovingAvg_1/subSub*batch_normalization_5/moving_variance/read'batch_normalization_5/moments/Squeeze_1*
T0*8
_class.
,*loc:@batch_normalization_5/moving_variance
Ñ
+batch_normalization_5/AssignMovingAvg_1/mulMul+batch_normalization_5/AssignMovingAvg_1/sub-batch_normalization_5/AssignMovingAvg_1/decay*
T0*8
_class.
,*loc:@batch_normalization_5/moving_variance
Þ
'batch_normalization_5/AssignMovingAvg_1	AssignSub%batch_normalization_5/moving_variance+batch_normalization_5/AssignMovingAvg_1/mul*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_5/moving_variance

!batch_normalization_5/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

]
#batch_normalization_5/cond/switch_tIdentity#batch_normalization_5/cond/Switch:1*
T0

[
#batch_normalization_5/cond/switch_fIdentity!batch_normalization_5/cond/Switch*
T0

c
"batch_normalization_5/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

»
#batch_normalization_5/cond/Switch_1Switch%batch_normalization_5/batchnorm/add_1"batch_normalization_5/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_5/batchnorm/add_1
}
*batch_normalization_5/cond/batchnorm/add/yConst$^batch_normalization_5/cond/switch_f*
valueB
 *o:*
dtype0
Ì
/batch_normalization_5/cond/batchnorm/add/SwitchSwitch*batch_normalization_5/moving_variance/read"batch_normalization_5/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_5/moving_variance

(batch_normalization_5/cond/batchnorm/addAdd/batch_normalization_5/cond/batchnorm/add/Switch*batch_normalization_5/cond/batchnorm/add/y*
T0
f
*batch_normalization_5/cond/batchnorm/RsqrtRsqrt(batch_normalization_5/cond/batchnorm/add*
T0
¸
/batch_normalization_5/cond/batchnorm/mul/SwitchSwitch batch_normalization_5/gamma/read"batch_normalization_5/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_5/gamma

(batch_normalization_5/cond/batchnorm/mulMul*batch_normalization_5/cond/batchnorm/Rsqrt/batch_normalization_5/cond/batchnorm/mul/Switch*
T0
§
1batch_normalization_5/cond/batchnorm/mul_1/SwitchSwitchconv2d_5/convolution"batch_normalization_5/cond/pred_id*
T0*'
_class
loc:@conv2d_5/convolution

*batch_normalization_5/cond/batchnorm/mul_1Mul1batch_normalization_5/cond/batchnorm/mul_1/Switch(batch_normalization_5/cond/batchnorm/mul*
T0
Æ
1batch_normalization_5/cond/batchnorm/mul_2/SwitchSwitch&batch_normalization_5/moving_mean/read"batch_normalization_5/cond/pred_id*
T0*4
_class*
(&loc:@batch_normalization_5/moving_mean

*batch_normalization_5/cond/batchnorm/mul_2Mul1batch_normalization_5/cond/batchnorm/mul_2/Switch(batch_normalization_5/cond/batchnorm/mul*
T0
¶
/batch_normalization_5/cond/batchnorm/sub/SwitchSwitchbatch_normalization_5/beta/read"batch_normalization_5/cond/pred_id*
T0*-
_class#
!loc:@batch_normalization_5/beta

(batch_normalization_5/cond/batchnorm/subSub/batch_normalization_5/cond/batchnorm/sub/Switch*batch_normalization_5/cond/batchnorm/mul_2*
T0

*batch_normalization_5/cond/batchnorm/add_1Add*batch_normalization_5/cond/batchnorm/mul_1(batch_normalization_5/cond/batchnorm/sub*
T0

 batch_normalization_5/cond/MergeMerge*batch_normalization_5/cond/batchnorm/add_1%batch_normalization_5/cond/Switch_1:1*
T0*
N
A
leakyrelu_5/NegNeg batch_normalization_5/cond/Merge*
T0
2
leakyrelu_5/ReluReluleakyrelu_5/Neg*
T0
E
leakyrelu_5/Relu_1Relu batch_normalization_5/cond/Merge*
T0
>
leakyrelu_5/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
D
leakyrelu_5/mulMulleakyrelu_5/Constleakyrelu_5/Relu*
T0
D
leakyrelu_5/subSubleakyrelu_5/Relu_1leakyrelu_5/mul*
T0

maxpooling2d_3/MaxPoolMaxPoolleakyrelu_5/sub*
ksize
*
paddingSAME*
T0*
data_formatNHWC*
strides

Z
conv2d_6/random_uniform/shapeConst*%
valueB"            *
dtype0
H
conv2d_6/random_uniform/minConst*
valueB
 *«ª*½*
dtype0
H
conv2d_6/random_uniform/maxConst*
valueB
 *«ª*=*
dtype0

%conv2d_6/random_uniform/RandomUniformRandomUniformconv2d_6/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2Áº
e
conv2d_6/random_uniform/subSubconv2d_6/random_uniform/maxconv2d_6/random_uniform/min*
T0
o
conv2d_6/random_uniform/mulMul%conv2d_6/random_uniform/RandomUniformconv2d_6/random_uniform/sub*
T0
a
conv2d_6/random_uniformAddconv2d_6/random_uniform/mulconv2d_6/random_uniform/min*
T0
m
conv2d_6/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
 
conv2d_6/kernel/AssignAssignconv2d_6/kernelconv2d_6/random_uniform*
use_locking(*
T0*"
_class
loc:@conv2d_6/kernel*
validate_shape(
^
conv2d_6/kernel/readIdentityconv2d_6/kernel*
T0*"
_class
loc:@conv2d_6/kernel
8
conv2d_6/SquareSquareconv2d_6/kernel/read*
T0
;
conv2d_6/mul/xConst*
valueB
 *o:*
dtype0
=
conv2d_6/mulMulconv2d_6/mul/xconv2d_6/Square*
T0
K
conv2d_6/ConstConst*%
valueB"             *
dtype0
W
conv2d_6/SumSumconv2d_6/mulconv2d_6/Const*

Tidx0*
	keep_dims( *
T0
;
conv2d_6/add/xConst*
valueB
 *    *
dtype0
:
conv2d_6/addAddconv2d_6/add/xconv2d_6/Sum*
T0
W
"conv2d_6/convolution/dilation_rateConst*
valueB"      *
dtype0
Ü
conv2d_6/convolutionConv2Dmaxpooling2d_3/MaxPoolconv2d_6/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
M
batch_normalization_6/ConstConst*
valueB*  ?*
dtype0
l
batch_normalization_6/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
È
"batch_normalization_6/gamma/AssignAssignbatch_normalization_6/gammabatch_normalization_6/Const*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_6/gamma*
validate_shape(

 batch_normalization_6/gamma/readIdentitybatch_normalization_6/gamma*
T0*.
_class$
" loc:@batch_normalization_6/gamma
O
batch_normalization_6/Const_1Const*
valueB*    *
dtype0
k
batch_normalization_6/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ç
!batch_normalization_6/beta/AssignAssignbatch_normalization_6/betabatch_normalization_6/Const_1*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_6/beta*
validate_shape(

batch_normalization_6/beta/readIdentitybatch_normalization_6/beta*
T0*-
_class#
!loc:@batch_normalization_6/beta
O
batch_normalization_6/Const_2Const*
valueB*    *
dtype0
r
!batch_normalization_6/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ü
(batch_normalization_6/moving_mean/AssignAssign!batch_normalization_6/moving_meanbatch_normalization_6/Const_2*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_6/moving_mean*
validate_shape(

&batch_normalization_6/moving_mean/readIdentity!batch_normalization_6/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_6/moving_mean
O
batch_normalization_6/Const_3Const*
valueB*  ?*
dtype0
v
%batch_normalization_6/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
è
,batch_normalization_6/moving_variance/AssignAssign%batch_normalization_6/moving_variancebatch_normalization_6/Const_3*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_6/moving_variance*
validate_shape(
 
*batch_normalization_6/moving_variance/readIdentity%batch_normalization_6/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_6/moving_variance
m
4batch_normalization_6/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

"batch_normalization_6/moments/meanMeanconv2d_6/convolution4batch_normalization_6/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
g
*batch_normalization_6/moments/StopGradientStopGradient"batch_normalization_6/moments/mean*
T0

/batch_normalization_6/moments/SquaredDifferenceSquaredDifferenceconv2d_6/convolution*batch_normalization_6/moments/StopGradient*
T0
q
8batch_normalization_6/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
¿
&batch_normalization_6/moments/varianceMean/batch_normalization_6/moments/SquaredDifference8batch_normalization_6/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
v
%batch_normalization_6/moments/SqueezeSqueeze"batch_normalization_6/moments/mean*
squeeze_dims
 *
T0
|
'batch_normalization_6/moments/Squeeze_1Squeeze&batch_normalization_6/moments/variance*
squeeze_dims
 *
T0
R
%batch_normalization_6/batchnorm/add/yConst*
valueB
 *o:*
dtype0

#batch_normalization_6/batchnorm/addAdd'batch_normalization_6/moments/Squeeze_1%batch_normalization_6/batchnorm/add/y*
T0
\
%batch_normalization_6/batchnorm/RsqrtRsqrt#batch_normalization_6/batchnorm/add*
T0
|
#batch_normalization_6/batchnorm/mulMul%batch_normalization_6/batchnorm/Rsqrt batch_normalization_6/gamma/read*
T0
p
%batch_normalization_6/batchnorm/mul_1Mulconv2d_6/convolution#batch_normalization_6/batchnorm/mul*
T0

%batch_normalization_6/batchnorm/mul_2Mul%batch_normalization_6/moments/Squeeze#batch_normalization_6/batchnorm/mul*
T0
{
#batch_normalization_6/batchnorm/subSubbatch_normalization_6/beta/read%batch_normalization_6/batchnorm/mul_2*
T0

%batch_normalization_6/batchnorm/add_1Add%batch_normalization_6/batchnorm/mul_1#batch_normalization_6/batchnorm/sub*
T0

+batch_normalization_6/AssignMovingAvg/decayConst*4
_class*
(&loc:@batch_normalization_6/moving_mean*
valueB
 *
×#<*
dtype0
¾
)batch_normalization_6/AssignMovingAvg/subSub&batch_normalization_6/moving_mean/read%batch_normalization_6/moments/Squeeze*
T0*4
_class*
(&loc:@batch_normalization_6/moving_mean
Ç
)batch_normalization_6/AssignMovingAvg/mulMul)batch_normalization_6/AssignMovingAvg/sub+batch_normalization_6/AssignMovingAvg/decay*
T0*4
_class*
(&loc:@batch_normalization_6/moving_mean
Ò
%batch_normalization_6/AssignMovingAvg	AssignSub!batch_normalization_6/moving_mean)batch_normalization_6/AssignMovingAvg/mul*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_6/moving_mean

-batch_normalization_6/AssignMovingAvg_1/decayConst*8
_class.
,*loc:@batch_normalization_6/moving_variance*
valueB
 *
×#<*
dtype0
Ê
+batch_normalization_6/AssignMovingAvg_1/subSub*batch_normalization_6/moving_variance/read'batch_normalization_6/moments/Squeeze_1*
T0*8
_class.
,*loc:@batch_normalization_6/moving_variance
Ñ
+batch_normalization_6/AssignMovingAvg_1/mulMul+batch_normalization_6/AssignMovingAvg_1/sub-batch_normalization_6/AssignMovingAvg_1/decay*
T0*8
_class.
,*loc:@batch_normalization_6/moving_variance
Þ
'batch_normalization_6/AssignMovingAvg_1	AssignSub%batch_normalization_6/moving_variance+batch_normalization_6/AssignMovingAvg_1/mul*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_6/moving_variance

!batch_normalization_6/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

]
#batch_normalization_6/cond/switch_tIdentity#batch_normalization_6/cond/Switch:1*
T0

[
#batch_normalization_6/cond/switch_fIdentity!batch_normalization_6/cond/Switch*
T0

c
"batch_normalization_6/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

»
#batch_normalization_6/cond/Switch_1Switch%batch_normalization_6/batchnorm/add_1"batch_normalization_6/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_6/batchnorm/add_1
}
*batch_normalization_6/cond/batchnorm/add/yConst$^batch_normalization_6/cond/switch_f*
valueB
 *o:*
dtype0
Ì
/batch_normalization_6/cond/batchnorm/add/SwitchSwitch*batch_normalization_6/moving_variance/read"batch_normalization_6/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_6/moving_variance

(batch_normalization_6/cond/batchnorm/addAdd/batch_normalization_6/cond/batchnorm/add/Switch*batch_normalization_6/cond/batchnorm/add/y*
T0
f
*batch_normalization_6/cond/batchnorm/RsqrtRsqrt(batch_normalization_6/cond/batchnorm/add*
T0
¸
/batch_normalization_6/cond/batchnorm/mul/SwitchSwitch batch_normalization_6/gamma/read"batch_normalization_6/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_6/gamma

(batch_normalization_6/cond/batchnorm/mulMul*batch_normalization_6/cond/batchnorm/Rsqrt/batch_normalization_6/cond/batchnorm/mul/Switch*
T0
§
1batch_normalization_6/cond/batchnorm/mul_1/SwitchSwitchconv2d_6/convolution"batch_normalization_6/cond/pred_id*
T0*'
_class
loc:@conv2d_6/convolution

*batch_normalization_6/cond/batchnorm/mul_1Mul1batch_normalization_6/cond/batchnorm/mul_1/Switch(batch_normalization_6/cond/batchnorm/mul*
T0
Æ
1batch_normalization_6/cond/batchnorm/mul_2/SwitchSwitch&batch_normalization_6/moving_mean/read"batch_normalization_6/cond/pred_id*
T0*4
_class*
(&loc:@batch_normalization_6/moving_mean

*batch_normalization_6/cond/batchnorm/mul_2Mul1batch_normalization_6/cond/batchnorm/mul_2/Switch(batch_normalization_6/cond/batchnorm/mul*
T0
¶
/batch_normalization_6/cond/batchnorm/sub/SwitchSwitchbatch_normalization_6/beta/read"batch_normalization_6/cond/pred_id*
T0*-
_class#
!loc:@batch_normalization_6/beta

(batch_normalization_6/cond/batchnorm/subSub/batch_normalization_6/cond/batchnorm/sub/Switch*batch_normalization_6/cond/batchnorm/mul_2*
T0

*batch_normalization_6/cond/batchnorm/add_1Add*batch_normalization_6/cond/batchnorm/mul_1(batch_normalization_6/cond/batchnorm/sub*
T0

 batch_normalization_6/cond/MergeMerge*batch_normalization_6/cond/batchnorm/add_1%batch_normalization_6/cond/Switch_1:1*
T0*
N
A
leakyrelu_6/NegNeg batch_normalization_6/cond/Merge*
T0
2
leakyrelu_6/ReluReluleakyrelu_6/Neg*
T0
E
leakyrelu_6/Relu_1Relu batch_normalization_6/cond/Merge*
T0
>
leakyrelu_6/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
D
leakyrelu_6/mulMulleakyrelu_6/Constleakyrelu_6/Relu*
T0
D
leakyrelu_6/subSubleakyrelu_6/Relu_1leakyrelu_6/mul*
T0
Z
conv2d_7/random_uniform/shapeConst*%
valueB"            *
dtype0
H
conv2d_7/random_uniform/minConst*
valueB
 *   ¾*
dtype0
H
conv2d_7/random_uniform/maxConst*
valueB
 *   >*
dtype0

%conv2d_7/random_uniform/RandomUniformRandomUniformconv2d_7/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2©Â
e
conv2d_7/random_uniform/subSubconv2d_7/random_uniform/maxconv2d_7/random_uniform/min*
T0
o
conv2d_7/random_uniform/mulMul%conv2d_7/random_uniform/RandomUniformconv2d_7/random_uniform/sub*
T0
a
conv2d_7/random_uniformAddconv2d_7/random_uniform/mulconv2d_7/random_uniform/min*
T0
m
conv2d_7/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
 
conv2d_7/kernel/AssignAssignconv2d_7/kernelconv2d_7/random_uniform*
use_locking(*
T0*"
_class
loc:@conv2d_7/kernel*
validate_shape(
^
conv2d_7/kernel/readIdentityconv2d_7/kernel*
T0*"
_class
loc:@conv2d_7/kernel
8
conv2d_7/SquareSquareconv2d_7/kernel/read*
T0
;
conv2d_7/mul/xConst*
valueB
 *o:*
dtype0
=
conv2d_7/mulMulconv2d_7/mul/xconv2d_7/Square*
T0
K
conv2d_7/ConstConst*%
valueB"             *
dtype0
W
conv2d_7/SumSumconv2d_7/mulconv2d_7/Const*

Tidx0*
	keep_dims( *
T0
;
conv2d_7/add/xConst*
valueB
 *    *
dtype0
:
conv2d_7/addAddconv2d_7/add/xconv2d_7/Sum*
T0
W
"conv2d_7/convolution/dilation_rateConst*
valueB"      *
dtype0
Õ
conv2d_7/convolutionConv2Dleakyrelu_6/subconv2d_7/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
M
batch_normalization_7/ConstConst*
valueB*  ?*
dtype0
l
batch_normalization_7/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
È
"batch_normalization_7/gamma/AssignAssignbatch_normalization_7/gammabatch_normalization_7/Const*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_7/gamma*
validate_shape(

 batch_normalization_7/gamma/readIdentitybatch_normalization_7/gamma*
T0*.
_class$
" loc:@batch_normalization_7/gamma
O
batch_normalization_7/Const_1Const*
valueB*    *
dtype0
k
batch_normalization_7/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ç
!batch_normalization_7/beta/AssignAssignbatch_normalization_7/betabatch_normalization_7/Const_1*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_7/beta*
validate_shape(

batch_normalization_7/beta/readIdentitybatch_normalization_7/beta*
T0*-
_class#
!loc:@batch_normalization_7/beta
O
batch_normalization_7/Const_2Const*
valueB*    *
dtype0
r
!batch_normalization_7/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ü
(batch_normalization_7/moving_mean/AssignAssign!batch_normalization_7/moving_meanbatch_normalization_7/Const_2*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_7/moving_mean*
validate_shape(

&batch_normalization_7/moving_mean/readIdentity!batch_normalization_7/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_7/moving_mean
O
batch_normalization_7/Const_3Const*
valueB*  ?*
dtype0
v
%batch_normalization_7/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
è
,batch_normalization_7/moving_variance/AssignAssign%batch_normalization_7/moving_variancebatch_normalization_7/Const_3*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_7/moving_variance*
validate_shape(
 
*batch_normalization_7/moving_variance/readIdentity%batch_normalization_7/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_7/moving_variance
m
4batch_normalization_7/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

"batch_normalization_7/moments/meanMeanconv2d_7/convolution4batch_normalization_7/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
g
*batch_normalization_7/moments/StopGradientStopGradient"batch_normalization_7/moments/mean*
T0

/batch_normalization_7/moments/SquaredDifferenceSquaredDifferenceconv2d_7/convolution*batch_normalization_7/moments/StopGradient*
T0
q
8batch_normalization_7/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
¿
&batch_normalization_7/moments/varianceMean/batch_normalization_7/moments/SquaredDifference8batch_normalization_7/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
v
%batch_normalization_7/moments/SqueezeSqueeze"batch_normalization_7/moments/mean*
squeeze_dims
 *
T0
|
'batch_normalization_7/moments/Squeeze_1Squeeze&batch_normalization_7/moments/variance*
squeeze_dims
 *
T0
R
%batch_normalization_7/batchnorm/add/yConst*
valueB
 *o:*
dtype0

#batch_normalization_7/batchnorm/addAdd'batch_normalization_7/moments/Squeeze_1%batch_normalization_7/batchnorm/add/y*
T0
\
%batch_normalization_7/batchnorm/RsqrtRsqrt#batch_normalization_7/batchnorm/add*
T0
|
#batch_normalization_7/batchnorm/mulMul%batch_normalization_7/batchnorm/Rsqrt batch_normalization_7/gamma/read*
T0
p
%batch_normalization_7/batchnorm/mul_1Mulconv2d_7/convolution#batch_normalization_7/batchnorm/mul*
T0

%batch_normalization_7/batchnorm/mul_2Mul%batch_normalization_7/moments/Squeeze#batch_normalization_7/batchnorm/mul*
T0
{
#batch_normalization_7/batchnorm/subSubbatch_normalization_7/beta/read%batch_normalization_7/batchnorm/mul_2*
T0

%batch_normalization_7/batchnorm/add_1Add%batch_normalization_7/batchnorm/mul_1#batch_normalization_7/batchnorm/sub*
T0

+batch_normalization_7/AssignMovingAvg/decayConst*4
_class*
(&loc:@batch_normalization_7/moving_mean*
valueB
 *
×#<*
dtype0
¾
)batch_normalization_7/AssignMovingAvg/subSub&batch_normalization_7/moving_mean/read%batch_normalization_7/moments/Squeeze*
T0*4
_class*
(&loc:@batch_normalization_7/moving_mean
Ç
)batch_normalization_7/AssignMovingAvg/mulMul)batch_normalization_7/AssignMovingAvg/sub+batch_normalization_7/AssignMovingAvg/decay*
T0*4
_class*
(&loc:@batch_normalization_7/moving_mean
Ò
%batch_normalization_7/AssignMovingAvg	AssignSub!batch_normalization_7/moving_mean)batch_normalization_7/AssignMovingAvg/mul*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_7/moving_mean

-batch_normalization_7/AssignMovingAvg_1/decayConst*8
_class.
,*loc:@batch_normalization_7/moving_variance*
valueB
 *
×#<*
dtype0
Ê
+batch_normalization_7/AssignMovingAvg_1/subSub*batch_normalization_7/moving_variance/read'batch_normalization_7/moments/Squeeze_1*
T0*8
_class.
,*loc:@batch_normalization_7/moving_variance
Ñ
+batch_normalization_7/AssignMovingAvg_1/mulMul+batch_normalization_7/AssignMovingAvg_1/sub-batch_normalization_7/AssignMovingAvg_1/decay*
T0*8
_class.
,*loc:@batch_normalization_7/moving_variance
Þ
'batch_normalization_7/AssignMovingAvg_1	AssignSub%batch_normalization_7/moving_variance+batch_normalization_7/AssignMovingAvg_1/mul*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_7/moving_variance

!batch_normalization_7/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

]
#batch_normalization_7/cond/switch_tIdentity#batch_normalization_7/cond/Switch:1*
T0

[
#batch_normalization_7/cond/switch_fIdentity!batch_normalization_7/cond/Switch*
T0

c
"batch_normalization_7/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

»
#batch_normalization_7/cond/Switch_1Switch%batch_normalization_7/batchnorm/add_1"batch_normalization_7/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_7/batchnorm/add_1
}
*batch_normalization_7/cond/batchnorm/add/yConst$^batch_normalization_7/cond/switch_f*
valueB
 *o:*
dtype0
Ì
/batch_normalization_7/cond/batchnorm/add/SwitchSwitch*batch_normalization_7/moving_variance/read"batch_normalization_7/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_7/moving_variance

(batch_normalization_7/cond/batchnorm/addAdd/batch_normalization_7/cond/batchnorm/add/Switch*batch_normalization_7/cond/batchnorm/add/y*
T0
f
*batch_normalization_7/cond/batchnorm/RsqrtRsqrt(batch_normalization_7/cond/batchnorm/add*
T0
¸
/batch_normalization_7/cond/batchnorm/mul/SwitchSwitch batch_normalization_7/gamma/read"batch_normalization_7/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_7/gamma

(batch_normalization_7/cond/batchnorm/mulMul*batch_normalization_7/cond/batchnorm/Rsqrt/batch_normalization_7/cond/batchnorm/mul/Switch*
T0
§
1batch_normalization_7/cond/batchnorm/mul_1/SwitchSwitchconv2d_7/convolution"batch_normalization_7/cond/pred_id*
T0*'
_class
loc:@conv2d_7/convolution

*batch_normalization_7/cond/batchnorm/mul_1Mul1batch_normalization_7/cond/batchnorm/mul_1/Switch(batch_normalization_7/cond/batchnorm/mul*
T0
Æ
1batch_normalization_7/cond/batchnorm/mul_2/SwitchSwitch&batch_normalization_7/moving_mean/read"batch_normalization_7/cond/pred_id*
T0*4
_class*
(&loc:@batch_normalization_7/moving_mean

*batch_normalization_7/cond/batchnorm/mul_2Mul1batch_normalization_7/cond/batchnorm/mul_2/Switch(batch_normalization_7/cond/batchnorm/mul*
T0
¶
/batch_normalization_7/cond/batchnorm/sub/SwitchSwitchbatch_normalization_7/beta/read"batch_normalization_7/cond/pred_id*
T0*-
_class#
!loc:@batch_normalization_7/beta

(batch_normalization_7/cond/batchnorm/subSub/batch_normalization_7/cond/batchnorm/sub/Switch*batch_normalization_7/cond/batchnorm/mul_2*
T0

*batch_normalization_7/cond/batchnorm/add_1Add*batch_normalization_7/cond/batchnorm/mul_1(batch_normalization_7/cond/batchnorm/sub*
T0

 batch_normalization_7/cond/MergeMerge*batch_normalization_7/cond/batchnorm/add_1%batch_normalization_7/cond/Switch_1:1*
T0*
N
A
leakyrelu_7/NegNeg batch_normalization_7/cond/Merge*
T0
2
leakyrelu_7/ReluReluleakyrelu_7/Neg*
T0
E
leakyrelu_7/Relu_1Relu batch_normalization_7/cond/Merge*
T0
>
leakyrelu_7/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
D
leakyrelu_7/mulMulleakyrelu_7/Constleakyrelu_7/Relu*
T0
D
leakyrelu_7/subSubleakyrelu_7/Relu_1leakyrelu_7/mul*
T0
Z
conv2d_8/random_uniform/shapeConst*%
valueB"            *
dtype0
H
conv2d_8/random_uniform/minConst*
valueB
 *«ª*½*
dtype0
H
conv2d_8/random_uniform/maxConst*
valueB
 *«ª*=*
dtype0

%conv2d_8/random_uniform/RandomUniformRandomUniformconv2d_8/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2õà
e
conv2d_8/random_uniform/subSubconv2d_8/random_uniform/maxconv2d_8/random_uniform/min*
T0
o
conv2d_8/random_uniform/mulMul%conv2d_8/random_uniform/RandomUniformconv2d_8/random_uniform/sub*
T0
a
conv2d_8/random_uniformAddconv2d_8/random_uniform/mulconv2d_8/random_uniform/min*
T0
m
conv2d_8/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
 
conv2d_8/kernel/AssignAssignconv2d_8/kernelconv2d_8/random_uniform*
use_locking(*
T0*"
_class
loc:@conv2d_8/kernel*
validate_shape(
^
conv2d_8/kernel/readIdentityconv2d_8/kernel*
T0*"
_class
loc:@conv2d_8/kernel
8
conv2d_8/SquareSquareconv2d_8/kernel/read*
T0
;
conv2d_8/mul/xConst*
valueB
 *o:*
dtype0
=
conv2d_8/mulMulconv2d_8/mul/xconv2d_8/Square*
T0
K
conv2d_8/ConstConst*%
valueB"             *
dtype0
W
conv2d_8/SumSumconv2d_8/mulconv2d_8/Const*

Tidx0*
	keep_dims( *
T0
;
conv2d_8/add/xConst*
valueB
 *    *
dtype0
:
conv2d_8/addAddconv2d_8/add/xconv2d_8/Sum*
T0
W
"conv2d_8/convolution/dilation_rateConst*
valueB"      *
dtype0
Õ
conv2d_8/convolutionConv2Dleakyrelu_7/subconv2d_8/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
M
batch_normalization_8/ConstConst*
valueB*  ?*
dtype0
l
batch_normalization_8/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
È
"batch_normalization_8/gamma/AssignAssignbatch_normalization_8/gammabatch_normalization_8/Const*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_8/gamma*
validate_shape(

 batch_normalization_8/gamma/readIdentitybatch_normalization_8/gamma*
T0*.
_class$
" loc:@batch_normalization_8/gamma
O
batch_normalization_8/Const_1Const*
valueB*    *
dtype0
k
batch_normalization_8/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ç
!batch_normalization_8/beta/AssignAssignbatch_normalization_8/betabatch_normalization_8/Const_1*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_8/beta*
validate_shape(

batch_normalization_8/beta/readIdentitybatch_normalization_8/beta*
T0*-
_class#
!loc:@batch_normalization_8/beta
O
batch_normalization_8/Const_2Const*
valueB*    *
dtype0
r
!batch_normalization_8/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ü
(batch_normalization_8/moving_mean/AssignAssign!batch_normalization_8/moving_meanbatch_normalization_8/Const_2*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_8/moving_mean*
validate_shape(

&batch_normalization_8/moving_mean/readIdentity!batch_normalization_8/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_8/moving_mean
O
batch_normalization_8/Const_3Const*
valueB*  ?*
dtype0
v
%batch_normalization_8/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
è
,batch_normalization_8/moving_variance/AssignAssign%batch_normalization_8/moving_variancebatch_normalization_8/Const_3*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_8/moving_variance*
validate_shape(
 
*batch_normalization_8/moving_variance/readIdentity%batch_normalization_8/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_8/moving_variance
m
4batch_normalization_8/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

"batch_normalization_8/moments/meanMeanconv2d_8/convolution4batch_normalization_8/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
g
*batch_normalization_8/moments/StopGradientStopGradient"batch_normalization_8/moments/mean*
T0

/batch_normalization_8/moments/SquaredDifferenceSquaredDifferenceconv2d_8/convolution*batch_normalization_8/moments/StopGradient*
T0
q
8batch_normalization_8/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
¿
&batch_normalization_8/moments/varianceMean/batch_normalization_8/moments/SquaredDifference8batch_normalization_8/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
v
%batch_normalization_8/moments/SqueezeSqueeze"batch_normalization_8/moments/mean*
squeeze_dims
 *
T0
|
'batch_normalization_8/moments/Squeeze_1Squeeze&batch_normalization_8/moments/variance*
squeeze_dims
 *
T0
R
%batch_normalization_8/batchnorm/add/yConst*
valueB
 *o:*
dtype0

#batch_normalization_8/batchnorm/addAdd'batch_normalization_8/moments/Squeeze_1%batch_normalization_8/batchnorm/add/y*
T0
\
%batch_normalization_8/batchnorm/RsqrtRsqrt#batch_normalization_8/batchnorm/add*
T0
|
#batch_normalization_8/batchnorm/mulMul%batch_normalization_8/batchnorm/Rsqrt batch_normalization_8/gamma/read*
T0
p
%batch_normalization_8/batchnorm/mul_1Mulconv2d_8/convolution#batch_normalization_8/batchnorm/mul*
T0

%batch_normalization_8/batchnorm/mul_2Mul%batch_normalization_8/moments/Squeeze#batch_normalization_8/batchnorm/mul*
T0
{
#batch_normalization_8/batchnorm/subSubbatch_normalization_8/beta/read%batch_normalization_8/batchnorm/mul_2*
T0

%batch_normalization_8/batchnorm/add_1Add%batch_normalization_8/batchnorm/mul_1#batch_normalization_8/batchnorm/sub*
T0

+batch_normalization_8/AssignMovingAvg/decayConst*4
_class*
(&loc:@batch_normalization_8/moving_mean*
valueB
 *
×#<*
dtype0
¾
)batch_normalization_8/AssignMovingAvg/subSub&batch_normalization_8/moving_mean/read%batch_normalization_8/moments/Squeeze*
T0*4
_class*
(&loc:@batch_normalization_8/moving_mean
Ç
)batch_normalization_8/AssignMovingAvg/mulMul)batch_normalization_8/AssignMovingAvg/sub+batch_normalization_8/AssignMovingAvg/decay*
T0*4
_class*
(&loc:@batch_normalization_8/moving_mean
Ò
%batch_normalization_8/AssignMovingAvg	AssignSub!batch_normalization_8/moving_mean)batch_normalization_8/AssignMovingAvg/mul*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_8/moving_mean

-batch_normalization_8/AssignMovingAvg_1/decayConst*8
_class.
,*loc:@batch_normalization_8/moving_variance*
valueB
 *
×#<*
dtype0
Ê
+batch_normalization_8/AssignMovingAvg_1/subSub*batch_normalization_8/moving_variance/read'batch_normalization_8/moments/Squeeze_1*
T0*8
_class.
,*loc:@batch_normalization_8/moving_variance
Ñ
+batch_normalization_8/AssignMovingAvg_1/mulMul+batch_normalization_8/AssignMovingAvg_1/sub-batch_normalization_8/AssignMovingAvg_1/decay*
T0*8
_class.
,*loc:@batch_normalization_8/moving_variance
Þ
'batch_normalization_8/AssignMovingAvg_1	AssignSub%batch_normalization_8/moving_variance+batch_normalization_8/AssignMovingAvg_1/mul*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_8/moving_variance

!batch_normalization_8/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

]
#batch_normalization_8/cond/switch_tIdentity#batch_normalization_8/cond/Switch:1*
T0

[
#batch_normalization_8/cond/switch_fIdentity!batch_normalization_8/cond/Switch*
T0

c
"batch_normalization_8/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

»
#batch_normalization_8/cond/Switch_1Switch%batch_normalization_8/batchnorm/add_1"batch_normalization_8/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_8/batchnorm/add_1
}
*batch_normalization_8/cond/batchnorm/add/yConst$^batch_normalization_8/cond/switch_f*
valueB
 *o:*
dtype0
Ì
/batch_normalization_8/cond/batchnorm/add/SwitchSwitch*batch_normalization_8/moving_variance/read"batch_normalization_8/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_8/moving_variance

(batch_normalization_8/cond/batchnorm/addAdd/batch_normalization_8/cond/batchnorm/add/Switch*batch_normalization_8/cond/batchnorm/add/y*
T0
f
*batch_normalization_8/cond/batchnorm/RsqrtRsqrt(batch_normalization_8/cond/batchnorm/add*
T0
¸
/batch_normalization_8/cond/batchnorm/mul/SwitchSwitch batch_normalization_8/gamma/read"batch_normalization_8/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_8/gamma

(batch_normalization_8/cond/batchnorm/mulMul*batch_normalization_8/cond/batchnorm/Rsqrt/batch_normalization_8/cond/batchnorm/mul/Switch*
T0
§
1batch_normalization_8/cond/batchnorm/mul_1/SwitchSwitchconv2d_8/convolution"batch_normalization_8/cond/pred_id*
T0*'
_class
loc:@conv2d_8/convolution

*batch_normalization_8/cond/batchnorm/mul_1Mul1batch_normalization_8/cond/batchnorm/mul_1/Switch(batch_normalization_8/cond/batchnorm/mul*
T0
Æ
1batch_normalization_8/cond/batchnorm/mul_2/SwitchSwitch&batch_normalization_8/moving_mean/read"batch_normalization_8/cond/pred_id*
T0*4
_class*
(&loc:@batch_normalization_8/moving_mean

*batch_normalization_8/cond/batchnorm/mul_2Mul1batch_normalization_8/cond/batchnorm/mul_2/Switch(batch_normalization_8/cond/batchnorm/mul*
T0
¶
/batch_normalization_8/cond/batchnorm/sub/SwitchSwitchbatch_normalization_8/beta/read"batch_normalization_8/cond/pred_id*
T0*-
_class#
!loc:@batch_normalization_8/beta

(batch_normalization_8/cond/batchnorm/subSub/batch_normalization_8/cond/batchnorm/sub/Switch*batch_normalization_8/cond/batchnorm/mul_2*
T0

*batch_normalization_8/cond/batchnorm/add_1Add*batch_normalization_8/cond/batchnorm/mul_1(batch_normalization_8/cond/batchnorm/sub*
T0

 batch_normalization_8/cond/MergeMerge*batch_normalization_8/cond/batchnorm/add_1%batch_normalization_8/cond/Switch_1:1*
T0*
N
A
leakyrelu_8/NegNeg batch_normalization_8/cond/Merge*
T0
2
leakyrelu_8/ReluReluleakyrelu_8/Neg*
T0
E
leakyrelu_8/Relu_1Relu batch_normalization_8/cond/Merge*
T0
>
leakyrelu_8/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
D
leakyrelu_8/mulMulleakyrelu_8/Constleakyrelu_8/Relu*
T0
D
leakyrelu_8/subSubleakyrelu_8/Relu_1leakyrelu_8/mul*
T0

maxpooling2d_4/MaxPoolMaxPoolleakyrelu_8/sub*
ksize
*
paddingSAME*
T0*
data_formatNHWC*
strides

Z
conv2d_9/random_uniform/shapeConst*%
valueB"            *
dtype0
H
conv2d_9/random_uniform/minConst*
valueB
 *ï[ñ¼*
dtype0
H
conv2d_9/random_uniform/maxConst*
valueB
 *ï[ñ<*
dtype0

%conv2d_9/random_uniform/RandomUniformRandomUniformconv2d_9/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2ÌÑ
e
conv2d_9/random_uniform/subSubconv2d_9/random_uniform/maxconv2d_9/random_uniform/min*
T0
o
conv2d_9/random_uniform/mulMul%conv2d_9/random_uniform/RandomUniformconv2d_9/random_uniform/sub*
T0
a
conv2d_9/random_uniformAddconv2d_9/random_uniform/mulconv2d_9/random_uniform/min*
T0
m
conv2d_9/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
 
conv2d_9/kernel/AssignAssignconv2d_9/kernelconv2d_9/random_uniform*
use_locking(*
T0*"
_class
loc:@conv2d_9/kernel*
validate_shape(
^
conv2d_9/kernel/readIdentityconv2d_9/kernel*
T0*"
_class
loc:@conv2d_9/kernel
8
conv2d_9/SquareSquareconv2d_9/kernel/read*
T0
;
conv2d_9/mul/xConst*
valueB
 *o:*
dtype0
=
conv2d_9/mulMulconv2d_9/mul/xconv2d_9/Square*
T0
K
conv2d_9/ConstConst*%
valueB"             *
dtype0
W
conv2d_9/SumSumconv2d_9/mulconv2d_9/Const*

Tidx0*
	keep_dims( *
T0
;
conv2d_9/add/xConst*
valueB
 *    *
dtype0
:
conv2d_9/addAddconv2d_9/add/xconv2d_9/Sum*
T0
W
"conv2d_9/convolution/dilation_rateConst*
valueB"      *
dtype0
Ü
conv2d_9/convolutionConv2Dmaxpooling2d_4/MaxPoolconv2d_9/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
M
batch_normalization_9/ConstConst*
valueB*  ?*
dtype0
l
batch_normalization_9/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
È
"batch_normalization_9/gamma/AssignAssignbatch_normalization_9/gammabatch_normalization_9/Const*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_9/gamma*
validate_shape(

 batch_normalization_9/gamma/readIdentitybatch_normalization_9/gamma*
T0*.
_class$
" loc:@batch_normalization_9/gamma
O
batch_normalization_9/Const_1Const*
valueB*    *
dtype0
k
batch_normalization_9/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ç
!batch_normalization_9/beta/AssignAssignbatch_normalization_9/betabatch_normalization_9/Const_1*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_9/beta*
validate_shape(

batch_normalization_9/beta/readIdentitybatch_normalization_9/beta*
T0*-
_class#
!loc:@batch_normalization_9/beta
O
batch_normalization_9/Const_2Const*
valueB*    *
dtype0
r
!batch_normalization_9/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ü
(batch_normalization_9/moving_mean/AssignAssign!batch_normalization_9/moving_meanbatch_normalization_9/Const_2*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_9/moving_mean*
validate_shape(

&batch_normalization_9/moving_mean/readIdentity!batch_normalization_9/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_9/moving_mean
O
batch_normalization_9/Const_3Const*
valueB*  ?*
dtype0
v
%batch_normalization_9/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
è
,batch_normalization_9/moving_variance/AssignAssign%batch_normalization_9/moving_variancebatch_normalization_9/Const_3*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_9/moving_variance*
validate_shape(
 
*batch_normalization_9/moving_variance/readIdentity%batch_normalization_9/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_9/moving_variance
m
4batch_normalization_9/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

"batch_normalization_9/moments/meanMeanconv2d_9/convolution4batch_normalization_9/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
g
*batch_normalization_9/moments/StopGradientStopGradient"batch_normalization_9/moments/mean*
T0

/batch_normalization_9/moments/SquaredDifferenceSquaredDifferenceconv2d_9/convolution*batch_normalization_9/moments/StopGradient*
T0
q
8batch_normalization_9/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
¿
&batch_normalization_9/moments/varianceMean/batch_normalization_9/moments/SquaredDifference8batch_normalization_9/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
v
%batch_normalization_9/moments/SqueezeSqueeze"batch_normalization_9/moments/mean*
squeeze_dims
 *
T0
|
'batch_normalization_9/moments/Squeeze_1Squeeze&batch_normalization_9/moments/variance*
squeeze_dims
 *
T0
R
%batch_normalization_9/batchnorm/add/yConst*
valueB
 *o:*
dtype0

#batch_normalization_9/batchnorm/addAdd'batch_normalization_9/moments/Squeeze_1%batch_normalization_9/batchnorm/add/y*
T0
\
%batch_normalization_9/batchnorm/RsqrtRsqrt#batch_normalization_9/batchnorm/add*
T0
|
#batch_normalization_9/batchnorm/mulMul%batch_normalization_9/batchnorm/Rsqrt batch_normalization_9/gamma/read*
T0
p
%batch_normalization_9/batchnorm/mul_1Mulconv2d_9/convolution#batch_normalization_9/batchnorm/mul*
T0

%batch_normalization_9/batchnorm/mul_2Mul%batch_normalization_9/moments/Squeeze#batch_normalization_9/batchnorm/mul*
T0
{
#batch_normalization_9/batchnorm/subSubbatch_normalization_9/beta/read%batch_normalization_9/batchnorm/mul_2*
T0

%batch_normalization_9/batchnorm/add_1Add%batch_normalization_9/batchnorm/mul_1#batch_normalization_9/batchnorm/sub*
T0

+batch_normalization_9/AssignMovingAvg/decayConst*4
_class*
(&loc:@batch_normalization_9/moving_mean*
valueB
 *
×#<*
dtype0
¾
)batch_normalization_9/AssignMovingAvg/subSub&batch_normalization_9/moving_mean/read%batch_normalization_9/moments/Squeeze*
T0*4
_class*
(&loc:@batch_normalization_9/moving_mean
Ç
)batch_normalization_9/AssignMovingAvg/mulMul)batch_normalization_9/AssignMovingAvg/sub+batch_normalization_9/AssignMovingAvg/decay*
T0*4
_class*
(&loc:@batch_normalization_9/moving_mean
Ò
%batch_normalization_9/AssignMovingAvg	AssignSub!batch_normalization_9/moving_mean)batch_normalization_9/AssignMovingAvg/mul*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_9/moving_mean

-batch_normalization_9/AssignMovingAvg_1/decayConst*8
_class.
,*loc:@batch_normalization_9/moving_variance*
valueB
 *
×#<*
dtype0
Ê
+batch_normalization_9/AssignMovingAvg_1/subSub*batch_normalization_9/moving_variance/read'batch_normalization_9/moments/Squeeze_1*
T0*8
_class.
,*loc:@batch_normalization_9/moving_variance
Ñ
+batch_normalization_9/AssignMovingAvg_1/mulMul+batch_normalization_9/AssignMovingAvg_1/sub-batch_normalization_9/AssignMovingAvg_1/decay*
T0*8
_class.
,*loc:@batch_normalization_9/moving_variance
Þ
'batch_normalization_9/AssignMovingAvg_1	AssignSub%batch_normalization_9/moving_variance+batch_normalization_9/AssignMovingAvg_1/mul*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_9/moving_variance

!batch_normalization_9/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

]
#batch_normalization_9/cond/switch_tIdentity#batch_normalization_9/cond/Switch:1*
T0

[
#batch_normalization_9/cond/switch_fIdentity!batch_normalization_9/cond/Switch*
T0

c
"batch_normalization_9/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

»
#batch_normalization_9/cond/Switch_1Switch%batch_normalization_9/batchnorm/add_1"batch_normalization_9/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_9/batchnorm/add_1
}
*batch_normalization_9/cond/batchnorm/add/yConst$^batch_normalization_9/cond/switch_f*
valueB
 *o:*
dtype0
Ì
/batch_normalization_9/cond/batchnorm/add/SwitchSwitch*batch_normalization_9/moving_variance/read"batch_normalization_9/cond/pred_id*
T0*8
_class.
,*loc:@batch_normalization_9/moving_variance

(batch_normalization_9/cond/batchnorm/addAdd/batch_normalization_9/cond/batchnorm/add/Switch*batch_normalization_9/cond/batchnorm/add/y*
T0
f
*batch_normalization_9/cond/batchnorm/RsqrtRsqrt(batch_normalization_9/cond/batchnorm/add*
T0
¸
/batch_normalization_9/cond/batchnorm/mul/SwitchSwitch batch_normalization_9/gamma/read"batch_normalization_9/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_9/gamma

(batch_normalization_9/cond/batchnorm/mulMul*batch_normalization_9/cond/batchnorm/Rsqrt/batch_normalization_9/cond/batchnorm/mul/Switch*
T0
§
1batch_normalization_9/cond/batchnorm/mul_1/SwitchSwitchconv2d_9/convolution"batch_normalization_9/cond/pred_id*
T0*'
_class
loc:@conv2d_9/convolution

*batch_normalization_9/cond/batchnorm/mul_1Mul1batch_normalization_9/cond/batchnorm/mul_1/Switch(batch_normalization_9/cond/batchnorm/mul*
T0
Æ
1batch_normalization_9/cond/batchnorm/mul_2/SwitchSwitch&batch_normalization_9/moving_mean/read"batch_normalization_9/cond/pred_id*
T0*4
_class*
(&loc:@batch_normalization_9/moving_mean

*batch_normalization_9/cond/batchnorm/mul_2Mul1batch_normalization_9/cond/batchnorm/mul_2/Switch(batch_normalization_9/cond/batchnorm/mul*
T0
¶
/batch_normalization_9/cond/batchnorm/sub/SwitchSwitchbatch_normalization_9/beta/read"batch_normalization_9/cond/pred_id*
T0*-
_class#
!loc:@batch_normalization_9/beta

(batch_normalization_9/cond/batchnorm/subSub/batch_normalization_9/cond/batchnorm/sub/Switch*batch_normalization_9/cond/batchnorm/mul_2*
T0

*batch_normalization_9/cond/batchnorm/add_1Add*batch_normalization_9/cond/batchnorm/mul_1(batch_normalization_9/cond/batchnorm/sub*
T0

 batch_normalization_9/cond/MergeMerge*batch_normalization_9/cond/batchnorm/add_1%batch_normalization_9/cond/Switch_1:1*
T0*
N
A
leakyrelu_9/NegNeg batch_normalization_9/cond/Merge*
T0
2
leakyrelu_9/ReluReluleakyrelu_9/Neg*
T0
E
leakyrelu_9/Relu_1Relu batch_normalization_9/cond/Merge*
T0
>
leakyrelu_9/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
D
leakyrelu_9/mulMulleakyrelu_9/Constleakyrelu_9/Relu*
T0
D
leakyrelu_9/subSubleakyrelu_9/Relu_1leakyrelu_9/mul*
T0
[
conv2d_10/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_10/random_uniform/minConst*
valueB
 *óµ½*
dtype0
I
conv2d_10/random_uniform/maxConst*
valueB
 *óµ=*
dtype0

&conv2d_10/random_uniform/RandomUniformRandomUniformconv2d_10/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2æT
h
conv2d_10/random_uniform/subSubconv2d_10/random_uniform/maxconv2d_10/random_uniform/min*
T0
r
conv2d_10/random_uniform/mulMul&conv2d_10/random_uniform/RandomUniformconv2d_10/random_uniform/sub*
T0
d
conv2d_10/random_uniformAddconv2d_10/random_uniform/mulconv2d_10/random_uniform/min*
T0
n
conv2d_10/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
¤
conv2d_10/kernel/AssignAssignconv2d_10/kernelconv2d_10/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_10/kernel*
validate_shape(
a
conv2d_10/kernel/readIdentityconv2d_10/kernel*
T0*#
_class
loc:@conv2d_10/kernel
:
conv2d_10/SquareSquareconv2d_10/kernel/read*
T0
<
conv2d_10/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_10/mulMulconv2d_10/mul/xconv2d_10/Square*
T0
L
conv2d_10/ConstConst*%
valueB"             *
dtype0
Z
conv2d_10/SumSumconv2d_10/mulconv2d_10/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_10/add/xConst*
valueB
 *    *
dtype0
=
conv2d_10/addAddconv2d_10/add/xconv2d_10/Sum*
T0
X
#conv2d_10/convolution/dilation_rateConst*
valueB"      *
dtype0
×
conv2d_10/convolutionConv2Dleakyrelu_9/subconv2d_10/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
N
batch_normalization_10/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_10/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_10/gamma/AssignAssignbatch_normalization_10/gammabatch_normalization_10/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_10/gamma*
validate_shape(

!batch_normalization_10/gamma/readIdentitybatch_normalization_10/gamma*
T0*/
_class%
#!loc:@batch_normalization_10/gamma
P
batch_normalization_10/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_10/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_10/beta/AssignAssignbatch_normalization_10/betabatch_normalization_10/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_10/beta*
validate_shape(

 batch_normalization_10/beta/readIdentitybatch_normalization_10/beta*
T0*.
_class$
" loc:@batch_normalization_10/beta
P
batch_normalization_10/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_10/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_10/moving_mean/AssignAssign"batch_normalization_10/moving_meanbatch_normalization_10/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_10/moving_mean*
validate_shape(

'batch_normalization_10/moving_mean/readIdentity"batch_normalization_10/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_10/moving_mean
P
batch_normalization_10/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_10/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_10/moving_variance/AssignAssign&batch_normalization_10/moving_variancebatch_normalization_10/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_10/moving_variance*
validate_shape(
£
+batch_normalization_10/moving_variance/readIdentity&batch_normalization_10/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_10/moving_variance
n
5batch_normalization_10/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_10/moments/meanMeanconv2d_10/convolution5batch_normalization_10/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_10/moments/StopGradientStopGradient#batch_normalization_10/moments/mean*
T0

0batch_normalization_10/moments/SquaredDifferenceSquaredDifferenceconv2d_10/convolution+batch_normalization_10/moments/StopGradient*
T0
r
9batch_normalization_10/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_10/moments/varianceMean0batch_normalization_10/moments/SquaredDifference9batch_normalization_10/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_10/moments/SqueezeSqueeze#batch_normalization_10/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_10/moments/Squeeze_1Squeeze'batch_normalization_10/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_10/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_10/batchnorm/addAdd(batch_normalization_10/moments/Squeeze_1&batch_normalization_10/batchnorm/add/y*
T0
^
&batch_normalization_10/batchnorm/RsqrtRsqrt$batch_normalization_10/batchnorm/add*
T0

$batch_normalization_10/batchnorm/mulMul&batch_normalization_10/batchnorm/Rsqrt!batch_normalization_10/gamma/read*
T0
s
&batch_normalization_10/batchnorm/mul_1Mulconv2d_10/convolution$batch_normalization_10/batchnorm/mul*
T0

&batch_normalization_10/batchnorm/mul_2Mul&batch_normalization_10/moments/Squeeze$batch_normalization_10/batchnorm/mul*
T0
~
$batch_normalization_10/batchnorm/subSub batch_normalization_10/beta/read&batch_normalization_10/batchnorm/mul_2*
T0

&batch_normalization_10/batchnorm/add_1Add&batch_normalization_10/batchnorm/mul_1$batch_normalization_10/batchnorm/sub*
T0

,batch_normalization_10/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_10/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_10/AssignMovingAvg/subSub'batch_normalization_10/moving_mean/read&batch_normalization_10/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_10/moving_mean
Ë
*batch_normalization_10/AssignMovingAvg/mulMul*batch_normalization_10/AssignMovingAvg/sub,batch_normalization_10/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_10/moving_mean
Ö
&batch_normalization_10/AssignMovingAvg	AssignSub"batch_normalization_10/moving_mean*batch_normalization_10/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_10/moving_mean

.batch_normalization_10/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_10/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_10/AssignMovingAvg_1/subSub+batch_normalization_10/moving_variance/read(batch_normalization_10/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_10/moving_variance
Õ
,batch_normalization_10/AssignMovingAvg_1/mulMul,batch_normalization_10/AssignMovingAvg_1/sub.batch_normalization_10/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_10/moving_variance
â
(batch_normalization_10/AssignMovingAvg_1	AssignSub&batch_normalization_10/moving_variance,batch_normalization_10/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_10/moving_variance

"batch_normalization_10/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_10/cond/switch_tIdentity$batch_normalization_10/cond/Switch:1*
T0

]
$batch_normalization_10/cond/switch_fIdentity"batch_normalization_10/cond/Switch*
T0

d
#batch_normalization_10/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_10/cond/Switch_1Switch&batch_normalization_10/batchnorm/add_1#batch_normalization_10/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_10/batchnorm/add_1

+batch_normalization_10/cond/batchnorm/add/yConst%^batch_normalization_10/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_10/cond/batchnorm/add/SwitchSwitch+batch_normalization_10/moving_variance/read#batch_normalization_10/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_10/moving_variance

)batch_normalization_10/cond/batchnorm/addAdd0batch_normalization_10/cond/batchnorm/add/Switch+batch_normalization_10/cond/batchnorm/add/y*
T0
h
+batch_normalization_10/cond/batchnorm/RsqrtRsqrt)batch_normalization_10/cond/batchnorm/add*
T0
¼
0batch_normalization_10/cond/batchnorm/mul/SwitchSwitch!batch_normalization_10/gamma/read#batch_normalization_10/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_10/gamma

)batch_normalization_10/cond/batchnorm/mulMul+batch_normalization_10/cond/batchnorm/Rsqrt0batch_normalization_10/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_10/cond/batchnorm/mul_1/SwitchSwitchconv2d_10/convolution#batch_normalization_10/cond/pred_id*
T0*(
_class
loc:@conv2d_10/convolution

+batch_normalization_10/cond/batchnorm/mul_1Mul2batch_normalization_10/cond/batchnorm/mul_1/Switch)batch_normalization_10/cond/batchnorm/mul*
T0
Ê
2batch_normalization_10/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_10/moving_mean/read#batch_normalization_10/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_10/moving_mean

+batch_normalization_10/cond/batchnorm/mul_2Mul2batch_normalization_10/cond/batchnorm/mul_2/Switch)batch_normalization_10/cond/batchnorm/mul*
T0
º
0batch_normalization_10/cond/batchnorm/sub/SwitchSwitch batch_normalization_10/beta/read#batch_normalization_10/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_10/beta

)batch_normalization_10/cond/batchnorm/subSub0batch_normalization_10/cond/batchnorm/sub/Switch+batch_normalization_10/cond/batchnorm/mul_2*
T0

+batch_normalization_10/cond/batchnorm/add_1Add+batch_normalization_10/cond/batchnorm/mul_1)batch_normalization_10/cond/batchnorm/sub*
T0

!batch_normalization_10/cond/MergeMerge+batch_normalization_10/cond/batchnorm/add_1&batch_normalization_10/cond/Switch_1:1*
T0*
N
C
leakyrelu_10/NegNeg!batch_normalization_10/cond/Merge*
T0
4
leakyrelu_10/ReluReluleakyrelu_10/Neg*
T0
G
leakyrelu_10/Relu_1Relu!batch_normalization_10/cond/Merge*
T0
?
leakyrelu_10/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_10/mulMulleakyrelu_10/Constleakyrelu_10/Relu*
T0
G
leakyrelu_10/subSubleakyrelu_10/Relu_1leakyrelu_10/mul*
T0
[
conv2d_11/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_11/random_uniform/minConst*
valueB
 *ï[ñ¼*
dtype0
I
conv2d_11/random_uniform/maxConst*
valueB
 *ï[ñ<*
dtype0

&conv2d_11/random_uniform/RandomUniformRandomUniformconv2d_11/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2ÀÚ
h
conv2d_11/random_uniform/subSubconv2d_11/random_uniform/maxconv2d_11/random_uniform/min*
T0
r
conv2d_11/random_uniform/mulMul&conv2d_11/random_uniform/RandomUniformconv2d_11/random_uniform/sub*
T0
d
conv2d_11/random_uniformAddconv2d_11/random_uniform/mulconv2d_11/random_uniform/min*
T0
n
conv2d_11/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
¤
conv2d_11/kernel/AssignAssignconv2d_11/kernelconv2d_11/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_11/kernel*
validate_shape(
a
conv2d_11/kernel/readIdentityconv2d_11/kernel*
T0*#
_class
loc:@conv2d_11/kernel
:
conv2d_11/SquareSquareconv2d_11/kernel/read*
T0
<
conv2d_11/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_11/mulMulconv2d_11/mul/xconv2d_11/Square*
T0
L
conv2d_11/ConstConst*%
valueB"             *
dtype0
Z
conv2d_11/SumSumconv2d_11/mulconv2d_11/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_11/add/xConst*
valueB
 *    *
dtype0
=
conv2d_11/addAddconv2d_11/add/xconv2d_11/Sum*
T0
X
#conv2d_11/convolution/dilation_rateConst*
valueB"      *
dtype0
Ø
conv2d_11/convolutionConv2Dleakyrelu_10/subconv2d_11/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
N
batch_normalization_11/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_11/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_11/gamma/AssignAssignbatch_normalization_11/gammabatch_normalization_11/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_11/gamma*
validate_shape(

!batch_normalization_11/gamma/readIdentitybatch_normalization_11/gamma*
T0*/
_class%
#!loc:@batch_normalization_11/gamma
P
batch_normalization_11/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_11/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_11/beta/AssignAssignbatch_normalization_11/betabatch_normalization_11/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_11/beta*
validate_shape(

 batch_normalization_11/beta/readIdentitybatch_normalization_11/beta*
T0*.
_class$
" loc:@batch_normalization_11/beta
P
batch_normalization_11/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_11/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_11/moving_mean/AssignAssign"batch_normalization_11/moving_meanbatch_normalization_11/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_11/moving_mean*
validate_shape(

'batch_normalization_11/moving_mean/readIdentity"batch_normalization_11/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_11/moving_mean
P
batch_normalization_11/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_11/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_11/moving_variance/AssignAssign&batch_normalization_11/moving_variancebatch_normalization_11/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_11/moving_variance*
validate_shape(
£
+batch_normalization_11/moving_variance/readIdentity&batch_normalization_11/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_11/moving_variance
n
5batch_normalization_11/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_11/moments/meanMeanconv2d_11/convolution5batch_normalization_11/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_11/moments/StopGradientStopGradient#batch_normalization_11/moments/mean*
T0

0batch_normalization_11/moments/SquaredDifferenceSquaredDifferenceconv2d_11/convolution+batch_normalization_11/moments/StopGradient*
T0
r
9batch_normalization_11/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_11/moments/varianceMean0batch_normalization_11/moments/SquaredDifference9batch_normalization_11/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_11/moments/SqueezeSqueeze#batch_normalization_11/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_11/moments/Squeeze_1Squeeze'batch_normalization_11/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_11/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_11/batchnorm/addAdd(batch_normalization_11/moments/Squeeze_1&batch_normalization_11/batchnorm/add/y*
T0
^
&batch_normalization_11/batchnorm/RsqrtRsqrt$batch_normalization_11/batchnorm/add*
T0

$batch_normalization_11/batchnorm/mulMul&batch_normalization_11/batchnorm/Rsqrt!batch_normalization_11/gamma/read*
T0
s
&batch_normalization_11/batchnorm/mul_1Mulconv2d_11/convolution$batch_normalization_11/batchnorm/mul*
T0

&batch_normalization_11/batchnorm/mul_2Mul&batch_normalization_11/moments/Squeeze$batch_normalization_11/batchnorm/mul*
T0
~
$batch_normalization_11/batchnorm/subSub batch_normalization_11/beta/read&batch_normalization_11/batchnorm/mul_2*
T0

&batch_normalization_11/batchnorm/add_1Add&batch_normalization_11/batchnorm/mul_1$batch_normalization_11/batchnorm/sub*
T0

,batch_normalization_11/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_11/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_11/AssignMovingAvg/subSub'batch_normalization_11/moving_mean/read&batch_normalization_11/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_11/moving_mean
Ë
*batch_normalization_11/AssignMovingAvg/mulMul*batch_normalization_11/AssignMovingAvg/sub,batch_normalization_11/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_11/moving_mean
Ö
&batch_normalization_11/AssignMovingAvg	AssignSub"batch_normalization_11/moving_mean*batch_normalization_11/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_11/moving_mean

.batch_normalization_11/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_11/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_11/AssignMovingAvg_1/subSub+batch_normalization_11/moving_variance/read(batch_normalization_11/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_11/moving_variance
Õ
,batch_normalization_11/AssignMovingAvg_1/mulMul,batch_normalization_11/AssignMovingAvg_1/sub.batch_normalization_11/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_11/moving_variance
â
(batch_normalization_11/AssignMovingAvg_1	AssignSub&batch_normalization_11/moving_variance,batch_normalization_11/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_11/moving_variance

"batch_normalization_11/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_11/cond/switch_tIdentity$batch_normalization_11/cond/Switch:1*
T0

]
$batch_normalization_11/cond/switch_fIdentity"batch_normalization_11/cond/Switch*
T0

d
#batch_normalization_11/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_11/cond/Switch_1Switch&batch_normalization_11/batchnorm/add_1#batch_normalization_11/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_11/batchnorm/add_1

+batch_normalization_11/cond/batchnorm/add/yConst%^batch_normalization_11/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_11/cond/batchnorm/add/SwitchSwitch+batch_normalization_11/moving_variance/read#batch_normalization_11/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_11/moving_variance

)batch_normalization_11/cond/batchnorm/addAdd0batch_normalization_11/cond/batchnorm/add/Switch+batch_normalization_11/cond/batchnorm/add/y*
T0
h
+batch_normalization_11/cond/batchnorm/RsqrtRsqrt)batch_normalization_11/cond/batchnorm/add*
T0
¼
0batch_normalization_11/cond/batchnorm/mul/SwitchSwitch!batch_normalization_11/gamma/read#batch_normalization_11/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_11/gamma

)batch_normalization_11/cond/batchnorm/mulMul+batch_normalization_11/cond/batchnorm/Rsqrt0batch_normalization_11/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_11/cond/batchnorm/mul_1/SwitchSwitchconv2d_11/convolution#batch_normalization_11/cond/pred_id*
T0*(
_class
loc:@conv2d_11/convolution

+batch_normalization_11/cond/batchnorm/mul_1Mul2batch_normalization_11/cond/batchnorm/mul_1/Switch)batch_normalization_11/cond/batchnorm/mul*
T0
Ê
2batch_normalization_11/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_11/moving_mean/read#batch_normalization_11/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_11/moving_mean

+batch_normalization_11/cond/batchnorm/mul_2Mul2batch_normalization_11/cond/batchnorm/mul_2/Switch)batch_normalization_11/cond/batchnorm/mul*
T0
º
0batch_normalization_11/cond/batchnorm/sub/SwitchSwitch batch_normalization_11/beta/read#batch_normalization_11/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_11/beta

)batch_normalization_11/cond/batchnorm/subSub0batch_normalization_11/cond/batchnorm/sub/Switch+batch_normalization_11/cond/batchnorm/mul_2*
T0

+batch_normalization_11/cond/batchnorm/add_1Add+batch_normalization_11/cond/batchnorm/mul_1)batch_normalization_11/cond/batchnorm/sub*
T0

!batch_normalization_11/cond/MergeMerge+batch_normalization_11/cond/batchnorm/add_1&batch_normalization_11/cond/Switch_1:1*
T0*
N
C
leakyrelu_11/NegNeg!batch_normalization_11/cond/Merge*
T0
4
leakyrelu_11/ReluReluleakyrelu_11/Neg*
T0
G
leakyrelu_11/Relu_1Relu!batch_normalization_11/cond/Merge*
T0
?
leakyrelu_11/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_11/mulMulleakyrelu_11/Constleakyrelu_11/Relu*
T0
G
leakyrelu_11/subSubleakyrelu_11/Relu_1leakyrelu_11/mul*
T0
[
conv2d_12/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_12/random_uniform/minConst*
valueB
 *óµ½*
dtype0
I
conv2d_12/random_uniform/maxConst*
valueB
 *óµ=*
dtype0

&conv2d_12/random_uniform/RandomUniformRandomUniformconv2d_12/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2¹Ú¯
h
conv2d_12/random_uniform/subSubconv2d_12/random_uniform/maxconv2d_12/random_uniform/min*
T0
r
conv2d_12/random_uniform/mulMul&conv2d_12/random_uniform/RandomUniformconv2d_12/random_uniform/sub*
T0
d
conv2d_12/random_uniformAddconv2d_12/random_uniform/mulconv2d_12/random_uniform/min*
T0
n
conv2d_12/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
¤
conv2d_12/kernel/AssignAssignconv2d_12/kernelconv2d_12/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_12/kernel*
validate_shape(
a
conv2d_12/kernel/readIdentityconv2d_12/kernel*
T0*#
_class
loc:@conv2d_12/kernel
:
conv2d_12/SquareSquareconv2d_12/kernel/read*
T0
<
conv2d_12/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_12/mulMulconv2d_12/mul/xconv2d_12/Square*
T0
L
conv2d_12/ConstConst*%
valueB"             *
dtype0
Z
conv2d_12/SumSumconv2d_12/mulconv2d_12/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_12/add/xConst*
valueB
 *    *
dtype0
=
conv2d_12/addAddconv2d_12/add/xconv2d_12/Sum*
T0
X
#conv2d_12/convolution/dilation_rateConst*
valueB"      *
dtype0
Ø
conv2d_12/convolutionConv2Dleakyrelu_11/subconv2d_12/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
N
batch_normalization_12/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_12/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_12/gamma/AssignAssignbatch_normalization_12/gammabatch_normalization_12/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_12/gamma*
validate_shape(

!batch_normalization_12/gamma/readIdentitybatch_normalization_12/gamma*
T0*/
_class%
#!loc:@batch_normalization_12/gamma
P
batch_normalization_12/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_12/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_12/beta/AssignAssignbatch_normalization_12/betabatch_normalization_12/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_12/beta*
validate_shape(

 batch_normalization_12/beta/readIdentitybatch_normalization_12/beta*
T0*.
_class$
" loc:@batch_normalization_12/beta
P
batch_normalization_12/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_12/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_12/moving_mean/AssignAssign"batch_normalization_12/moving_meanbatch_normalization_12/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_12/moving_mean*
validate_shape(

'batch_normalization_12/moving_mean/readIdentity"batch_normalization_12/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_12/moving_mean
P
batch_normalization_12/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_12/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_12/moving_variance/AssignAssign&batch_normalization_12/moving_variancebatch_normalization_12/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_12/moving_variance*
validate_shape(
£
+batch_normalization_12/moving_variance/readIdentity&batch_normalization_12/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_12/moving_variance
n
5batch_normalization_12/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_12/moments/meanMeanconv2d_12/convolution5batch_normalization_12/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_12/moments/StopGradientStopGradient#batch_normalization_12/moments/mean*
T0

0batch_normalization_12/moments/SquaredDifferenceSquaredDifferenceconv2d_12/convolution+batch_normalization_12/moments/StopGradient*
T0
r
9batch_normalization_12/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_12/moments/varianceMean0batch_normalization_12/moments/SquaredDifference9batch_normalization_12/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_12/moments/SqueezeSqueeze#batch_normalization_12/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_12/moments/Squeeze_1Squeeze'batch_normalization_12/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_12/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_12/batchnorm/addAdd(batch_normalization_12/moments/Squeeze_1&batch_normalization_12/batchnorm/add/y*
T0
^
&batch_normalization_12/batchnorm/RsqrtRsqrt$batch_normalization_12/batchnorm/add*
T0

$batch_normalization_12/batchnorm/mulMul&batch_normalization_12/batchnorm/Rsqrt!batch_normalization_12/gamma/read*
T0
s
&batch_normalization_12/batchnorm/mul_1Mulconv2d_12/convolution$batch_normalization_12/batchnorm/mul*
T0

&batch_normalization_12/batchnorm/mul_2Mul&batch_normalization_12/moments/Squeeze$batch_normalization_12/batchnorm/mul*
T0
~
$batch_normalization_12/batchnorm/subSub batch_normalization_12/beta/read&batch_normalization_12/batchnorm/mul_2*
T0

&batch_normalization_12/batchnorm/add_1Add&batch_normalization_12/batchnorm/mul_1$batch_normalization_12/batchnorm/sub*
T0

,batch_normalization_12/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_12/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_12/AssignMovingAvg/subSub'batch_normalization_12/moving_mean/read&batch_normalization_12/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_12/moving_mean
Ë
*batch_normalization_12/AssignMovingAvg/mulMul*batch_normalization_12/AssignMovingAvg/sub,batch_normalization_12/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_12/moving_mean
Ö
&batch_normalization_12/AssignMovingAvg	AssignSub"batch_normalization_12/moving_mean*batch_normalization_12/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_12/moving_mean

.batch_normalization_12/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_12/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_12/AssignMovingAvg_1/subSub+batch_normalization_12/moving_variance/read(batch_normalization_12/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_12/moving_variance
Õ
,batch_normalization_12/AssignMovingAvg_1/mulMul,batch_normalization_12/AssignMovingAvg_1/sub.batch_normalization_12/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_12/moving_variance
â
(batch_normalization_12/AssignMovingAvg_1	AssignSub&batch_normalization_12/moving_variance,batch_normalization_12/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_12/moving_variance

"batch_normalization_12/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_12/cond/switch_tIdentity$batch_normalization_12/cond/Switch:1*
T0

]
$batch_normalization_12/cond/switch_fIdentity"batch_normalization_12/cond/Switch*
T0

d
#batch_normalization_12/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_12/cond/Switch_1Switch&batch_normalization_12/batchnorm/add_1#batch_normalization_12/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_12/batchnorm/add_1

+batch_normalization_12/cond/batchnorm/add/yConst%^batch_normalization_12/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_12/cond/batchnorm/add/SwitchSwitch+batch_normalization_12/moving_variance/read#batch_normalization_12/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_12/moving_variance

)batch_normalization_12/cond/batchnorm/addAdd0batch_normalization_12/cond/batchnorm/add/Switch+batch_normalization_12/cond/batchnorm/add/y*
T0
h
+batch_normalization_12/cond/batchnorm/RsqrtRsqrt)batch_normalization_12/cond/batchnorm/add*
T0
¼
0batch_normalization_12/cond/batchnorm/mul/SwitchSwitch!batch_normalization_12/gamma/read#batch_normalization_12/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_12/gamma

)batch_normalization_12/cond/batchnorm/mulMul+batch_normalization_12/cond/batchnorm/Rsqrt0batch_normalization_12/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_12/cond/batchnorm/mul_1/SwitchSwitchconv2d_12/convolution#batch_normalization_12/cond/pred_id*
T0*(
_class
loc:@conv2d_12/convolution

+batch_normalization_12/cond/batchnorm/mul_1Mul2batch_normalization_12/cond/batchnorm/mul_1/Switch)batch_normalization_12/cond/batchnorm/mul*
T0
Ê
2batch_normalization_12/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_12/moving_mean/read#batch_normalization_12/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_12/moving_mean

+batch_normalization_12/cond/batchnorm/mul_2Mul2batch_normalization_12/cond/batchnorm/mul_2/Switch)batch_normalization_12/cond/batchnorm/mul*
T0
º
0batch_normalization_12/cond/batchnorm/sub/SwitchSwitch batch_normalization_12/beta/read#batch_normalization_12/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_12/beta

)batch_normalization_12/cond/batchnorm/subSub0batch_normalization_12/cond/batchnorm/sub/Switch+batch_normalization_12/cond/batchnorm/mul_2*
T0

+batch_normalization_12/cond/batchnorm/add_1Add+batch_normalization_12/cond/batchnorm/mul_1)batch_normalization_12/cond/batchnorm/sub*
T0

!batch_normalization_12/cond/MergeMerge+batch_normalization_12/cond/batchnorm/add_1&batch_normalization_12/cond/Switch_1:1*
T0*
N
C
leakyrelu_12/NegNeg!batch_normalization_12/cond/Merge*
T0
4
leakyrelu_12/ReluReluleakyrelu_12/Neg*
T0
G
leakyrelu_12/Relu_1Relu!batch_normalization_12/cond/Merge*
T0
?
leakyrelu_12/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_12/mulMulleakyrelu_12/Constleakyrelu_12/Relu*
T0
G
leakyrelu_12/subSubleakyrelu_12/Relu_1leakyrelu_12/mul*
T0
[
conv2d_13/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_13/random_uniform/minConst*
valueB
 *ï[ñ¼*
dtype0
I
conv2d_13/random_uniform/maxConst*
valueB
 *ï[ñ<*
dtype0

&conv2d_13/random_uniform/RandomUniformRandomUniformconv2d_13/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2Î¥ÿ
h
conv2d_13/random_uniform/subSubconv2d_13/random_uniform/maxconv2d_13/random_uniform/min*
T0
r
conv2d_13/random_uniform/mulMul&conv2d_13/random_uniform/RandomUniformconv2d_13/random_uniform/sub*
T0
d
conv2d_13/random_uniformAddconv2d_13/random_uniform/mulconv2d_13/random_uniform/min*
T0
n
conv2d_13/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
¤
conv2d_13/kernel/AssignAssignconv2d_13/kernelconv2d_13/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_13/kernel*
validate_shape(
a
conv2d_13/kernel/readIdentityconv2d_13/kernel*
T0*#
_class
loc:@conv2d_13/kernel
:
conv2d_13/SquareSquareconv2d_13/kernel/read*
T0
<
conv2d_13/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_13/mulMulconv2d_13/mul/xconv2d_13/Square*
T0
L
conv2d_13/ConstConst*%
valueB"             *
dtype0
Z
conv2d_13/SumSumconv2d_13/mulconv2d_13/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_13/add/xConst*
valueB
 *    *
dtype0
=
conv2d_13/addAddconv2d_13/add/xconv2d_13/Sum*
T0
X
#conv2d_13/convolution/dilation_rateConst*
valueB"      *
dtype0
Ø
conv2d_13/convolutionConv2Dleakyrelu_12/subconv2d_13/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
N
batch_normalization_13/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_13/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_13/gamma/AssignAssignbatch_normalization_13/gammabatch_normalization_13/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_13/gamma*
validate_shape(

!batch_normalization_13/gamma/readIdentitybatch_normalization_13/gamma*
T0*/
_class%
#!loc:@batch_normalization_13/gamma
P
batch_normalization_13/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_13/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_13/beta/AssignAssignbatch_normalization_13/betabatch_normalization_13/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_13/beta*
validate_shape(

 batch_normalization_13/beta/readIdentitybatch_normalization_13/beta*
T0*.
_class$
" loc:@batch_normalization_13/beta
P
batch_normalization_13/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_13/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_13/moving_mean/AssignAssign"batch_normalization_13/moving_meanbatch_normalization_13/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_13/moving_mean*
validate_shape(

'batch_normalization_13/moving_mean/readIdentity"batch_normalization_13/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_13/moving_mean
P
batch_normalization_13/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_13/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_13/moving_variance/AssignAssign&batch_normalization_13/moving_variancebatch_normalization_13/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_13/moving_variance*
validate_shape(
£
+batch_normalization_13/moving_variance/readIdentity&batch_normalization_13/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_13/moving_variance
n
5batch_normalization_13/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_13/moments/meanMeanconv2d_13/convolution5batch_normalization_13/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_13/moments/StopGradientStopGradient#batch_normalization_13/moments/mean*
T0

0batch_normalization_13/moments/SquaredDifferenceSquaredDifferenceconv2d_13/convolution+batch_normalization_13/moments/StopGradient*
T0
r
9batch_normalization_13/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_13/moments/varianceMean0batch_normalization_13/moments/SquaredDifference9batch_normalization_13/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_13/moments/SqueezeSqueeze#batch_normalization_13/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_13/moments/Squeeze_1Squeeze'batch_normalization_13/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_13/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_13/batchnorm/addAdd(batch_normalization_13/moments/Squeeze_1&batch_normalization_13/batchnorm/add/y*
T0
^
&batch_normalization_13/batchnorm/RsqrtRsqrt$batch_normalization_13/batchnorm/add*
T0

$batch_normalization_13/batchnorm/mulMul&batch_normalization_13/batchnorm/Rsqrt!batch_normalization_13/gamma/read*
T0
s
&batch_normalization_13/batchnorm/mul_1Mulconv2d_13/convolution$batch_normalization_13/batchnorm/mul*
T0

&batch_normalization_13/batchnorm/mul_2Mul&batch_normalization_13/moments/Squeeze$batch_normalization_13/batchnorm/mul*
T0
~
$batch_normalization_13/batchnorm/subSub batch_normalization_13/beta/read&batch_normalization_13/batchnorm/mul_2*
T0

&batch_normalization_13/batchnorm/add_1Add&batch_normalization_13/batchnorm/mul_1$batch_normalization_13/batchnorm/sub*
T0

,batch_normalization_13/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_13/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_13/AssignMovingAvg/subSub'batch_normalization_13/moving_mean/read&batch_normalization_13/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_13/moving_mean
Ë
*batch_normalization_13/AssignMovingAvg/mulMul*batch_normalization_13/AssignMovingAvg/sub,batch_normalization_13/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_13/moving_mean
Ö
&batch_normalization_13/AssignMovingAvg	AssignSub"batch_normalization_13/moving_mean*batch_normalization_13/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_13/moving_mean

.batch_normalization_13/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_13/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_13/AssignMovingAvg_1/subSub+batch_normalization_13/moving_variance/read(batch_normalization_13/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_13/moving_variance
Õ
,batch_normalization_13/AssignMovingAvg_1/mulMul,batch_normalization_13/AssignMovingAvg_1/sub.batch_normalization_13/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_13/moving_variance
â
(batch_normalization_13/AssignMovingAvg_1	AssignSub&batch_normalization_13/moving_variance,batch_normalization_13/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_13/moving_variance

"batch_normalization_13/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_13/cond/switch_tIdentity$batch_normalization_13/cond/Switch:1*
T0

]
$batch_normalization_13/cond/switch_fIdentity"batch_normalization_13/cond/Switch*
T0

d
#batch_normalization_13/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_13/cond/Switch_1Switch&batch_normalization_13/batchnorm/add_1#batch_normalization_13/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_13/batchnorm/add_1

+batch_normalization_13/cond/batchnorm/add/yConst%^batch_normalization_13/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_13/cond/batchnorm/add/SwitchSwitch+batch_normalization_13/moving_variance/read#batch_normalization_13/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_13/moving_variance

)batch_normalization_13/cond/batchnorm/addAdd0batch_normalization_13/cond/batchnorm/add/Switch+batch_normalization_13/cond/batchnorm/add/y*
T0
h
+batch_normalization_13/cond/batchnorm/RsqrtRsqrt)batch_normalization_13/cond/batchnorm/add*
T0
¼
0batch_normalization_13/cond/batchnorm/mul/SwitchSwitch!batch_normalization_13/gamma/read#batch_normalization_13/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_13/gamma

)batch_normalization_13/cond/batchnorm/mulMul+batch_normalization_13/cond/batchnorm/Rsqrt0batch_normalization_13/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_13/cond/batchnorm/mul_1/SwitchSwitchconv2d_13/convolution#batch_normalization_13/cond/pred_id*
T0*(
_class
loc:@conv2d_13/convolution

+batch_normalization_13/cond/batchnorm/mul_1Mul2batch_normalization_13/cond/batchnorm/mul_1/Switch)batch_normalization_13/cond/batchnorm/mul*
T0
Ê
2batch_normalization_13/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_13/moving_mean/read#batch_normalization_13/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_13/moving_mean

+batch_normalization_13/cond/batchnorm/mul_2Mul2batch_normalization_13/cond/batchnorm/mul_2/Switch)batch_normalization_13/cond/batchnorm/mul*
T0
º
0batch_normalization_13/cond/batchnorm/sub/SwitchSwitch batch_normalization_13/beta/read#batch_normalization_13/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_13/beta

)batch_normalization_13/cond/batchnorm/subSub0batch_normalization_13/cond/batchnorm/sub/Switch+batch_normalization_13/cond/batchnorm/mul_2*
T0

+batch_normalization_13/cond/batchnorm/add_1Add+batch_normalization_13/cond/batchnorm/mul_1)batch_normalization_13/cond/batchnorm/sub*
T0

!batch_normalization_13/cond/MergeMerge+batch_normalization_13/cond/batchnorm/add_1&batch_normalization_13/cond/Switch_1:1*
T0*
N
C
leakyrelu_13/NegNeg!batch_normalization_13/cond/Merge*
T0
4
leakyrelu_13/ReluReluleakyrelu_13/Neg*
T0
G
leakyrelu_13/Relu_1Relu!batch_normalization_13/cond/Merge*
T0
?
leakyrelu_13/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_13/mulMulleakyrelu_13/Constleakyrelu_13/Relu*
T0
G
leakyrelu_13/subSubleakyrelu_13/Relu_1leakyrelu_13/mul*
T0

maxpooling2d_5/MaxPoolMaxPoolleakyrelu_13/sub*
ksize
*
paddingSAME*
T0*
data_formatNHWC*
strides

[
conv2d_14/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_14/random_uniform/minConst*
valueB
 *«ªª¼*
dtype0
I
conv2d_14/random_uniform/maxConst*
valueB
 *«ªª<*
dtype0

&conv2d_14/random_uniform/RandomUniformRandomUniformconv2d_14/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2³
h
conv2d_14/random_uniform/subSubconv2d_14/random_uniform/maxconv2d_14/random_uniform/min*
T0
r
conv2d_14/random_uniform/mulMul&conv2d_14/random_uniform/RandomUniformconv2d_14/random_uniform/sub*
T0
d
conv2d_14/random_uniformAddconv2d_14/random_uniform/mulconv2d_14/random_uniform/min*
T0
n
conv2d_14/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
¤
conv2d_14/kernel/AssignAssignconv2d_14/kernelconv2d_14/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_14/kernel*
validate_shape(
a
conv2d_14/kernel/readIdentityconv2d_14/kernel*
T0*#
_class
loc:@conv2d_14/kernel
:
conv2d_14/SquareSquareconv2d_14/kernel/read*
T0
<
conv2d_14/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_14/mulMulconv2d_14/mul/xconv2d_14/Square*
T0
L
conv2d_14/ConstConst*%
valueB"             *
dtype0
Z
conv2d_14/SumSumconv2d_14/mulconv2d_14/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_14/add/xConst*
valueB
 *    *
dtype0
=
conv2d_14/addAddconv2d_14/add/xconv2d_14/Sum*
T0
X
#conv2d_14/convolution/dilation_rateConst*
valueB"      *
dtype0
Þ
conv2d_14/convolutionConv2Dmaxpooling2d_5/MaxPoolconv2d_14/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
N
batch_normalization_14/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_14/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_14/gamma/AssignAssignbatch_normalization_14/gammabatch_normalization_14/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_14/gamma*
validate_shape(

!batch_normalization_14/gamma/readIdentitybatch_normalization_14/gamma*
T0*/
_class%
#!loc:@batch_normalization_14/gamma
P
batch_normalization_14/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_14/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_14/beta/AssignAssignbatch_normalization_14/betabatch_normalization_14/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_14/beta*
validate_shape(

 batch_normalization_14/beta/readIdentitybatch_normalization_14/beta*
T0*.
_class$
" loc:@batch_normalization_14/beta
P
batch_normalization_14/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_14/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_14/moving_mean/AssignAssign"batch_normalization_14/moving_meanbatch_normalization_14/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_14/moving_mean*
validate_shape(

'batch_normalization_14/moving_mean/readIdentity"batch_normalization_14/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_14/moving_mean
P
batch_normalization_14/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_14/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_14/moving_variance/AssignAssign&batch_normalization_14/moving_variancebatch_normalization_14/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_14/moving_variance*
validate_shape(
£
+batch_normalization_14/moving_variance/readIdentity&batch_normalization_14/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_14/moving_variance
n
5batch_normalization_14/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_14/moments/meanMeanconv2d_14/convolution5batch_normalization_14/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_14/moments/StopGradientStopGradient#batch_normalization_14/moments/mean*
T0

0batch_normalization_14/moments/SquaredDifferenceSquaredDifferenceconv2d_14/convolution+batch_normalization_14/moments/StopGradient*
T0
r
9batch_normalization_14/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_14/moments/varianceMean0batch_normalization_14/moments/SquaredDifference9batch_normalization_14/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_14/moments/SqueezeSqueeze#batch_normalization_14/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_14/moments/Squeeze_1Squeeze'batch_normalization_14/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_14/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_14/batchnorm/addAdd(batch_normalization_14/moments/Squeeze_1&batch_normalization_14/batchnorm/add/y*
T0
^
&batch_normalization_14/batchnorm/RsqrtRsqrt$batch_normalization_14/batchnorm/add*
T0

$batch_normalization_14/batchnorm/mulMul&batch_normalization_14/batchnorm/Rsqrt!batch_normalization_14/gamma/read*
T0
s
&batch_normalization_14/batchnorm/mul_1Mulconv2d_14/convolution$batch_normalization_14/batchnorm/mul*
T0

&batch_normalization_14/batchnorm/mul_2Mul&batch_normalization_14/moments/Squeeze$batch_normalization_14/batchnorm/mul*
T0
~
$batch_normalization_14/batchnorm/subSub batch_normalization_14/beta/read&batch_normalization_14/batchnorm/mul_2*
T0

&batch_normalization_14/batchnorm/add_1Add&batch_normalization_14/batchnorm/mul_1$batch_normalization_14/batchnorm/sub*
T0

,batch_normalization_14/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_14/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_14/AssignMovingAvg/subSub'batch_normalization_14/moving_mean/read&batch_normalization_14/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_14/moving_mean
Ë
*batch_normalization_14/AssignMovingAvg/mulMul*batch_normalization_14/AssignMovingAvg/sub,batch_normalization_14/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_14/moving_mean
Ö
&batch_normalization_14/AssignMovingAvg	AssignSub"batch_normalization_14/moving_mean*batch_normalization_14/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_14/moving_mean

.batch_normalization_14/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_14/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_14/AssignMovingAvg_1/subSub+batch_normalization_14/moving_variance/read(batch_normalization_14/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_14/moving_variance
Õ
,batch_normalization_14/AssignMovingAvg_1/mulMul,batch_normalization_14/AssignMovingAvg_1/sub.batch_normalization_14/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_14/moving_variance
â
(batch_normalization_14/AssignMovingAvg_1	AssignSub&batch_normalization_14/moving_variance,batch_normalization_14/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_14/moving_variance

"batch_normalization_14/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_14/cond/switch_tIdentity$batch_normalization_14/cond/Switch:1*
T0

]
$batch_normalization_14/cond/switch_fIdentity"batch_normalization_14/cond/Switch*
T0

d
#batch_normalization_14/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_14/cond/Switch_1Switch&batch_normalization_14/batchnorm/add_1#batch_normalization_14/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_14/batchnorm/add_1

+batch_normalization_14/cond/batchnorm/add/yConst%^batch_normalization_14/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_14/cond/batchnorm/add/SwitchSwitch+batch_normalization_14/moving_variance/read#batch_normalization_14/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_14/moving_variance

)batch_normalization_14/cond/batchnorm/addAdd0batch_normalization_14/cond/batchnorm/add/Switch+batch_normalization_14/cond/batchnorm/add/y*
T0
h
+batch_normalization_14/cond/batchnorm/RsqrtRsqrt)batch_normalization_14/cond/batchnorm/add*
T0
¼
0batch_normalization_14/cond/batchnorm/mul/SwitchSwitch!batch_normalization_14/gamma/read#batch_normalization_14/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_14/gamma

)batch_normalization_14/cond/batchnorm/mulMul+batch_normalization_14/cond/batchnorm/Rsqrt0batch_normalization_14/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_14/cond/batchnorm/mul_1/SwitchSwitchconv2d_14/convolution#batch_normalization_14/cond/pred_id*
T0*(
_class
loc:@conv2d_14/convolution

+batch_normalization_14/cond/batchnorm/mul_1Mul2batch_normalization_14/cond/batchnorm/mul_1/Switch)batch_normalization_14/cond/batchnorm/mul*
T0
Ê
2batch_normalization_14/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_14/moving_mean/read#batch_normalization_14/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_14/moving_mean

+batch_normalization_14/cond/batchnorm/mul_2Mul2batch_normalization_14/cond/batchnorm/mul_2/Switch)batch_normalization_14/cond/batchnorm/mul*
T0
º
0batch_normalization_14/cond/batchnorm/sub/SwitchSwitch batch_normalization_14/beta/read#batch_normalization_14/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_14/beta

)batch_normalization_14/cond/batchnorm/subSub0batch_normalization_14/cond/batchnorm/sub/Switch+batch_normalization_14/cond/batchnorm/mul_2*
T0

+batch_normalization_14/cond/batchnorm/add_1Add+batch_normalization_14/cond/batchnorm/mul_1)batch_normalization_14/cond/batchnorm/sub*
T0

!batch_normalization_14/cond/MergeMerge+batch_normalization_14/cond/batchnorm/add_1&batch_normalization_14/cond/Switch_1:1*
T0*
N
C
leakyrelu_14/NegNeg!batch_normalization_14/cond/Merge*
T0
4
leakyrelu_14/ReluReluleakyrelu_14/Neg*
T0
G
leakyrelu_14/Relu_1Relu!batch_normalization_14/cond/Merge*
T0
?
leakyrelu_14/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_14/mulMulleakyrelu_14/Constleakyrelu_14/Relu*
T0
G
leakyrelu_14/subSubleakyrelu_14/Relu_1leakyrelu_14/mul*
T0
[
conv2d_15/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_15/random_uniform/minConst*
valueB
 *  ½*
dtype0
I
conv2d_15/random_uniform/maxConst*
valueB
 *  =*
dtype0

&conv2d_15/random_uniform/RandomUniformRandomUniformconv2d_15/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2éöü
h
conv2d_15/random_uniform/subSubconv2d_15/random_uniform/maxconv2d_15/random_uniform/min*
T0
r
conv2d_15/random_uniform/mulMul&conv2d_15/random_uniform/RandomUniformconv2d_15/random_uniform/sub*
T0
d
conv2d_15/random_uniformAddconv2d_15/random_uniform/mulconv2d_15/random_uniform/min*
T0
n
conv2d_15/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
¤
conv2d_15/kernel/AssignAssignconv2d_15/kernelconv2d_15/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_15/kernel*
validate_shape(
a
conv2d_15/kernel/readIdentityconv2d_15/kernel*
T0*#
_class
loc:@conv2d_15/kernel
:
conv2d_15/SquareSquareconv2d_15/kernel/read*
T0
<
conv2d_15/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_15/mulMulconv2d_15/mul/xconv2d_15/Square*
T0
L
conv2d_15/ConstConst*%
valueB"             *
dtype0
Z
conv2d_15/SumSumconv2d_15/mulconv2d_15/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_15/add/xConst*
valueB
 *    *
dtype0
=
conv2d_15/addAddconv2d_15/add/xconv2d_15/Sum*
T0
X
#conv2d_15/convolution/dilation_rateConst*
valueB"      *
dtype0
Ø
conv2d_15/convolutionConv2Dleakyrelu_14/subconv2d_15/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
N
batch_normalization_15/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_15/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_15/gamma/AssignAssignbatch_normalization_15/gammabatch_normalization_15/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_15/gamma*
validate_shape(

!batch_normalization_15/gamma/readIdentitybatch_normalization_15/gamma*
T0*/
_class%
#!loc:@batch_normalization_15/gamma
P
batch_normalization_15/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_15/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_15/beta/AssignAssignbatch_normalization_15/betabatch_normalization_15/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_15/beta*
validate_shape(

 batch_normalization_15/beta/readIdentitybatch_normalization_15/beta*
T0*.
_class$
" loc:@batch_normalization_15/beta
P
batch_normalization_15/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_15/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_15/moving_mean/AssignAssign"batch_normalization_15/moving_meanbatch_normalization_15/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_15/moving_mean*
validate_shape(

'batch_normalization_15/moving_mean/readIdentity"batch_normalization_15/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_15/moving_mean
P
batch_normalization_15/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_15/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_15/moving_variance/AssignAssign&batch_normalization_15/moving_variancebatch_normalization_15/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_15/moving_variance*
validate_shape(
£
+batch_normalization_15/moving_variance/readIdentity&batch_normalization_15/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_15/moving_variance
n
5batch_normalization_15/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_15/moments/meanMeanconv2d_15/convolution5batch_normalization_15/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_15/moments/StopGradientStopGradient#batch_normalization_15/moments/mean*
T0

0batch_normalization_15/moments/SquaredDifferenceSquaredDifferenceconv2d_15/convolution+batch_normalization_15/moments/StopGradient*
T0
r
9batch_normalization_15/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_15/moments/varianceMean0batch_normalization_15/moments/SquaredDifference9batch_normalization_15/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_15/moments/SqueezeSqueeze#batch_normalization_15/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_15/moments/Squeeze_1Squeeze'batch_normalization_15/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_15/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_15/batchnorm/addAdd(batch_normalization_15/moments/Squeeze_1&batch_normalization_15/batchnorm/add/y*
T0
^
&batch_normalization_15/batchnorm/RsqrtRsqrt$batch_normalization_15/batchnorm/add*
T0

$batch_normalization_15/batchnorm/mulMul&batch_normalization_15/batchnorm/Rsqrt!batch_normalization_15/gamma/read*
T0
s
&batch_normalization_15/batchnorm/mul_1Mulconv2d_15/convolution$batch_normalization_15/batchnorm/mul*
T0

&batch_normalization_15/batchnorm/mul_2Mul&batch_normalization_15/moments/Squeeze$batch_normalization_15/batchnorm/mul*
T0
~
$batch_normalization_15/batchnorm/subSub batch_normalization_15/beta/read&batch_normalization_15/batchnorm/mul_2*
T0

&batch_normalization_15/batchnorm/add_1Add&batch_normalization_15/batchnorm/mul_1$batch_normalization_15/batchnorm/sub*
T0

,batch_normalization_15/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_15/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_15/AssignMovingAvg/subSub'batch_normalization_15/moving_mean/read&batch_normalization_15/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_15/moving_mean
Ë
*batch_normalization_15/AssignMovingAvg/mulMul*batch_normalization_15/AssignMovingAvg/sub,batch_normalization_15/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_15/moving_mean
Ö
&batch_normalization_15/AssignMovingAvg	AssignSub"batch_normalization_15/moving_mean*batch_normalization_15/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_15/moving_mean

.batch_normalization_15/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_15/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_15/AssignMovingAvg_1/subSub+batch_normalization_15/moving_variance/read(batch_normalization_15/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_15/moving_variance
Õ
,batch_normalization_15/AssignMovingAvg_1/mulMul,batch_normalization_15/AssignMovingAvg_1/sub.batch_normalization_15/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_15/moving_variance
â
(batch_normalization_15/AssignMovingAvg_1	AssignSub&batch_normalization_15/moving_variance,batch_normalization_15/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_15/moving_variance

"batch_normalization_15/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_15/cond/switch_tIdentity$batch_normalization_15/cond/Switch:1*
T0

]
$batch_normalization_15/cond/switch_fIdentity"batch_normalization_15/cond/Switch*
T0

d
#batch_normalization_15/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_15/cond/Switch_1Switch&batch_normalization_15/batchnorm/add_1#batch_normalization_15/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_15/batchnorm/add_1

+batch_normalization_15/cond/batchnorm/add/yConst%^batch_normalization_15/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_15/cond/batchnorm/add/SwitchSwitch+batch_normalization_15/moving_variance/read#batch_normalization_15/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_15/moving_variance

)batch_normalization_15/cond/batchnorm/addAdd0batch_normalization_15/cond/batchnorm/add/Switch+batch_normalization_15/cond/batchnorm/add/y*
T0
h
+batch_normalization_15/cond/batchnorm/RsqrtRsqrt)batch_normalization_15/cond/batchnorm/add*
T0
¼
0batch_normalization_15/cond/batchnorm/mul/SwitchSwitch!batch_normalization_15/gamma/read#batch_normalization_15/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_15/gamma

)batch_normalization_15/cond/batchnorm/mulMul+batch_normalization_15/cond/batchnorm/Rsqrt0batch_normalization_15/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_15/cond/batchnorm/mul_1/SwitchSwitchconv2d_15/convolution#batch_normalization_15/cond/pred_id*
T0*(
_class
loc:@conv2d_15/convolution

+batch_normalization_15/cond/batchnorm/mul_1Mul2batch_normalization_15/cond/batchnorm/mul_1/Switch)batch_normalization_15/cond/batchnorm/mul*
T0
Ê
2batch_normalization_15/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_15/moving_mean/read#batch_normalization_15/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_15/moving_mean

+batch_normalization_15/cond/batchnorm/mul_2Mul2batch_normalization_15/cond/batchnorm/mul_2/Switch)batch_normalization_15/cond/batchnorm/mul*
T0
º
0batch_normalization_15/cond/batchnorm/sub/SwitchSwitch batch_normalization_15/beta/read#batch_normalization_15/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_15/beta

)batch_normalization_15/cond/batchnorm/subSub0batch_normalization_15/cond/batchnorm/sub/Switch+batch_normalization_15/cond/batchnorm/mul_2*
T0

+batch_normalization_15/cond/batchnorm/add_1Add+batch_normalization_15/cond/batchnorm/mul_1)batch_normalization_15/cond/batchnorm/sub*
T0

!batch_normalization_15/cond/MergeMerge+batch_normalization_15/cond/batchnorm/add_1&batch_normalization_15/cond/Switch_1:1*
T0*
N
C
leakyrelu_15/NegNeg!batch_normalization_15/cond/Merge*
T0
4
leakyrelu_15/ReluReluleakyrelu_15/Neg*
T0
G
leakyrelu_15/Relu_1Relu!batch_normalization_15/cond/Merge*
T0
?
leakyrelu_15/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_15/mulMulleakyrelu_15/Constleakyrelu_15/Relu*
T0
G
leakyrelu_15/subSubleakyrelu_15/Relu_1leakyrelu_15/mul*
T0
[
conv2d_16/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_16/random_uniform/minConst*
valueB
 *«ªª¼*
dtype0
I
conv2d_16/random_uniform/maxConst*
valueB
 *«ªª<*
dtype0

&conv2d_16/random_uniform/RandomUniformRandomUniformconv2d_16/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2×ìÝ
h
conv2d_16/random_uniform/subSubconv2d_16/random_uniform/maxconv2d_16/random_uniform/min*
T0
r
conv2d_16/random_uniform/mulMul&conv2d_16/random_uniform/RandomUniformconv2d_16/random_uniform/sub*
T0
d
conv2d_16/random_uniformAddconv2d_16/random_uniform/mulconv2d_16/random_uniform/min*
T0
n
conv2d_16/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
¤
conv2d_16/kernel/AssignAssignconv2d_16/kernelconv2d_16/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_16/kernel*
validate_shape(
a
conv2d_16/kernel/readIdentityconv2d_16/kernel*
T0*#
_class
loc:@conv2d_16/kernel
:
conv2d_16/SquareSquareconv2d_16/kernel/read*
T0
<
conv2d_16/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_16/mulMulconv2d_16/mul/xconv2d_16/Square*
T0
L
conv2d_16/ConstConst*%
valueB"             *
dtype0
Z
conv2d_16/SumSumconv2d_16/mulconv2d_16/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_16/add/xConst*
valueB
 *    *
dtype0
=
conv2d_16/addAddconv2d_16/add/xconv2d_16/Sum*
T0
X
#conv2d_16/convolution/dilation_rateConst*
valueB"      *
dtype0
Ø
conv2d_16/convolutionConv2Dleakyrelu_15/subconv2d_16/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
N
batch_normalization_16/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_16/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_16/gamma/AssignAssignbatch_normalization_16/gammabatch_normalization_16/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_16/gamma*
validate_shape(

!batch_normalization_16/gamma/readIdentitybatch_normalization_16/gamma*
T0*/
_class%
#!loc:@batch_normalization_16/gamma
P
batch_normalization_16/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_16/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_16/beta/AssignAssignbatch_normalization_16/betabatch_normalization_16/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_16/beta*
validate_shape(

 batch_normalization_16/beta/readIdentitybatch_normalization_16/beta*
T0*.
_class$
" loc:@batch_normalization_16/beta
P
batch_normalization_16/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_16/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_16/moving_mean/AssignAssign"batch_normalization_16/moving_meanbatch_normalization_16/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_16/moving_mean*
validate_shape(

'batch_normalization_16/moving_mean/readIdentity"batch_normalization_16/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_16/moving_mean
P
batch_normalization_16/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_16/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_16/moving_variance/AssignAssign&batch_normalization_16/moving_variancebatch_normalization_16/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_16/moving_variance*
validate_shape(
£
+batch_normalization_16/moving_variance/readIdentity&batch_normalization_16/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_16/moving_variance
n
5batch_normalization_16/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_16/moments/meanMeanconv2d_16/convolution5batch_normalization_16/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_16/moments/StopGradientStopGradient#batch_normalization_16/moments/mean*
T0

0batch_normalization_16/moments/SquaredDifferenceSquaredDifferenceconv2d_16/convolution+batch_normalization_16/moments/StopGradient*
T0
r
9batch_normalization_16/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_16/moments/varianceMean0batch_normalization_16/moments/SquaredDifference9batch_normalization_16/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_16/moments/SqueezeSqueeze#batch_normalization_16/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_16/moments/Squeeze_1Squeeze'batch_normalization_16/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_16/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_16/batchnorm/addAdd(batch_normalization_16/moments/Squeeze_1&batch_normalization_16/batchnorm/add/y*
T0
^
&batch_normalization_16/batchnorm/RsqrtRsqrt$batch_normalization_16/batchnorm/add*
T0

$batch_normalization_16/batchnorm/mulMul&batch_normalization_16/batchnorm/Rsqrt!batch_normalization_16/gamma/read*
T0
s
&batch_normalization_16/batchnorm/mul_1Mulconv2d_16/convolution$batch_normalization_16/batchnorm/mul*
T0

&batch_normalization_16/batchnorm/mul_2Mul&batch_normalization_16/moments/Squeeze$batch_normalization_16/batchnorm/mul*
T0
~
$batch_normalization_16/batchnorm/subSub batch_normalization_16/beta/read&batch_normalization_16/batchnorm/mul_2*
T0

&batch_normalization_16/batchnorm/add_1Add&batch_normalization_16/batchnorm/mul_1$batch_normalization_16/batchnorm/sub*
T0

,batch_normalization_16/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_16/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_16/AssignMovingAvg/subSub'batch_normalization_16/moving_mean/read&batch_normalization_16/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_16/moving_mean
Ë
*batch_normalization_16/AssignMovingAvg/mulMul*batch_normalization_16/AssignMovingAvg/sub,batch_normalization_16/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_16/moving_mean
Ö
&batch_normalization_16/AssignMovingAvg	AssignSub"batch_normalization_16/moving_mean*batch_normalization_16/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_16/moving_mean

.batch_normalization_16/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_16/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_16/AssignMovingAvg_1/subSub+batch_normalization_16/moving_variance/read(batch_normalization_16/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_16/moving_variance
Õ
,batch_normalization_16/AssignMovingAvg_1/mulMul,batch_normalization_16/AssignMovingAvg_1/sub.batch_normalization_16/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_16/moving_variance
â
(batch_normalization_16/AssignMovingAvg_1	AssignSub&batch_normalization_16/moving_variance,batch_normalization_16/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_16/moving_variance

"batch_normalization_16/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_16/cond/switch_tIdentity$batch_normalization_16/cond/Switch:1*
T0

]
$batch_normalization_16/cond/switch_fIdentity"batch_normalization_16/cond/Switch*
T0

d
#batch_normalization_16/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_16/cond/Switch_1Switch&batch_normalization_16/batchnorm/add_1#batch_normalization_16/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_16/batchnorm/add_1

+batch_normalization_16/cond/batchnorm/add/yConst%^batch_normalization_16/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_16/cond/batchnorm/add/SwitchSwitch+batch_normalization_16/moving_variance/read#batch_normalization_16/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_16/moving_variance

)batch_normalization_16/cond/batchnorm/addAdd0batch_normalization_16/cond/batchnorm/add/Switch+batch_normalization_16/cond/batchnorm/add/y*
T0
h
+batch_normalization_16/cond/batchnorm/RsqrtRsqrt)batch_normalization_16/cond/batchnorm/add*
T0
¼
0batch_normalization_16/cond/batchnorm/mul/SwitchSwitch!batch_normalization_16/gamma/read#batch_normalization_16/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_16/gamma

)batch_normalization_16/cond/batchnorm/mulMul+batch_normalization_16/cond/batchnorm/Rsqrt0batch_normalization_16/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_16/cond/batchnorm/mul_1/SwitchSwitchconv2d_16/convolution#batch_normalization_16/cond/pred_id*
T0*(
_class
loc:@conv2d_16/convolution

+batch_normalization_16/cond/batchnorm/mul_1Mul2batch_normalization_16/cond/batchnorm/mul_1/Switch)batch_normalization_16/cond/batchnorm/mul*
T0
Ê
2batch_normalization_16/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_16/moving_mean/read#batch_normalization_16/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_16/moving_mean

+batch_normalization_16/cond/batchnorm/mul_2Mul2batch_normalization_16/cond/batchnorm/mul_2/Switch)batch_normalization_16/cond/batchnorm/mul*
T0
º
0batch_normalization_16/cond/batchnorm/sub/SwitchSwitch batch_normalization_16/beta/read#batch_normalization_16/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_16/beta

)batch_normalization_16/cond/batchnorm/subSub0batch_normalization_16/cond/batchnorm/sub/Switch+batch_normalization_16/cond/batchnorm/mul_2*
T0

+batch_normalization_16/cond/batchnorm/add_1Add+batch_normalization_16/cond/batchnorm/mul_1)batch_normalization_16/cond/batchnorm/sub*
T0

!batch_normalization_16/cond/MergeMerge+batch_normalization_16/cond/batchnorm/add_1&batch_normalization_16/cond/Switch_1:1*
T0*
N
C
leakyrelu_16/NegNeg!batch_normalization_16/cond/Merge*
T0
4
leakyrelu_16/ReluReluleakyrelu_16/Neg*
T0
G
leakyrelu_16/Relu_1Relu!batch_normalization_16/cond/Merge*
T0
?
leakyrelu_16/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_16/mulMulleakyrelu_16/Constleakyrelu_16/Relu*
T0
G
leakyrelu_16/subSubleakyrelu_16/Relu_1leakyrelu_16/mul*
T0
[
conv2d_17/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_17/random_uniform/minConst*
valueB
 *  ½*
dtype0
I
conv2d_17/random_uniform/maxConst*
valueB
 *  =*
dtype0

&conv2d_17/random_uniform/RandomUniformRandomUniformconv2d_17/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2Å
h
conv2d_17/random_uniform/subSubconv2d_17/random_uniform/maxconv2d_17/random_uniform/min*
T0
r
conv2d_17/random_uniform/mulMul&conv2d_17/random_uniform/RandomUniformconv2d_17/random_uniform/sub*
T0
d
conv2d_17/random_uniformAddconv2d_17/random_uniform/mulconv2d_17/random_uniform/min*
T0
n
conv2d_17/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
¤
conv2d_17/kernel/AssignAssignconv2d_17/kernelconv2d_17/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_17/kernel*
validate_shape(
a
conv2d_17/kernel/readIdentityconv2d_17/kernel*
T0*#
_class
loc:@conv2d_17/kernel
:
conv2d_17/SquareSquareconv2d_17/kernel/read*
T0
<
conv2d_17/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_17/mulMulconv2d_17/mul/xconv2d_17/Square*
T0
L
conv2d_17/ConstConst*%
valueB"             *
dtype0
Z
conv2d_17/SumSumconv2d_17/mulconv2d_17/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_17/add/xConst*
valueB
 *    *
dtype0
=
conv2d_17/addAddconv2d_17/add/xconv2d_17/Sum*
T0
X
#conv2d_17/convolution/dilation_rateConst*
valueB"      *
dtype0
Ø
conv2d_17/convolutionConv2Dleakyrelu_16/subconv2d_17/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
N
batch_normalization_17/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_17/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_17/gamma/AssignAssignbatch_normalization_17/gammabatch_normalization_17/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_17/gamma*
validate_shape(

!batch_normalization_17/gamma/readIdentitybatch_normalization_17/gamma*
T0*/
_class%
#!loc:@batch_normalization_17/gamma
P
batch_normalization_17/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_17/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_17/beta/AssignAssignbatch_normalization_17/betabatch_normalization_17/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_17/beta*
validate_shape(

 batch_normalization_17/beta/readIdentitybatch_normalization_17/beta*
T0*.
_class$
" loc:@batch_normalization_17/beta
P
batch_normalization_17/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_17/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_17/moving_mean/AssignAssign"batch_normalization_17/moving_meanbatch_normalization_17/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_17/moving_mean*
validate_shape(

'batch_normalization_17/moving_mean/readIdentity"batch_normalization_17/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_17/moving_mean
P
batch_normalization_17/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_17/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_17/moving_variance/AssignAssign&batch_normalization_17/moving_variancebatch_normalization_17/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_17/moving_variance*
validate_shape(
£
+batch_normalization_17/moving_variance/readIdentity&batch_normalization_17/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_17/moving_variance
n
5batch_normalization_17/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_17/moments/meanMeanconv2d_17/convolution5batch_normalization_17/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_17/moments/StopGradientStopGradient#batch_normalization_17/moments/mean*
T0

0batch_normalization_17/moments/SquaredDifferenceSquaredDifferenceconv2d_17/convolution+batch_normalization_17/moments/StopGradient*
T0
r
9batch_normalization_17/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_17/moments/varianceMean0batch_normalization_17/moments/SquaredDifference9batch_normalization_17/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_17/moments/SqueezeSqueeze#batch_normalization_17/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_17/moments/Squeeze_1Squeeze'batch_normalization_17/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_17/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_17/batchnorm/addAdd(batch_normalization_17/moments/Squeeze_1&batch_normalization_17/batchnorm/add/y*
T0
^
&batch_normalization_17/batchnorm/RsqrtRsqrt$batch_normalization_17/batchnorm/add*
T0

$batch_normalization_17/batchnorm/mulMul&batch_normalization_17/batchnorm/Rsqrt!batch_normalization_17/gamma/read*
T0
s
&batch_normalization_17/batchnorm/mul_1Mulconv2d_17/convolution$batch_normalization_17/batchnorm/mul*
T0

&batch_normalization_17/batchnorm/mul_2Mul&batch_normalization_17/moments/Squeeze$batch_normalization_17/batchnorm/mul*
T0
~
$batch_normalization_17/batchnorm/subSub batch_normalization_17/beta/read&batch_normalization_17/batchnorm/mul_2*
T0

&batch_normalization_17/batchnorm/add_1Add&batch_normalization_17/batchnorm/mul_1$batch_normalization_17/batchnorm/sub*
T0

,batch_normalization_17/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_17/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_17/AssignMovingAvg/subSub'batch_normalization_17/moving_mean/read&batch_normalization_17/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_17/moving_mean
Ë
*batch_normalization_17/AssignMovingAvg/mulMul*batch_normalization_17/AssignMovingAvg/sub,batch_normalization_17/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_17/moving_mean
Ö
&batch_normalization_17/AssignMovingAvg	AssignSub"batch_normalization_17/moving_mean*batch_normalization_17/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_17/moving_mean

.batch_normalization_17/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_17/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_17/AssignMovingAvg_1/subSub+batch_normalization_17/moving_variance/read(batch_normalization_17/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_17/moving_variance
Õ
,batch_normalization_17/AssignMovingAvg_1/mulMul,batch_normalization_17/AssignMovingAvg_1/sub.batch_normalization_17/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_17/moving_variance
â
(batch_normalization_17/AssignMovingAvg_1	AssignSub&batch_normalization_17/moving_variance,batch_normalization_17/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_17/moving_variance

"batch_normalization_17/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_17/cond/switch_tIdentity$batch_normalization_17/cond/Switch:1*
T0

]
$batch_normalization_17/cond/switch_fIdentity"batch_normalization_17/cond/Switch*
T0

d
#batch_normalization_17/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_17/cond/Switch_1Switch&batch_normalization_17/batchnorm/add_1#batch_normalization_17/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_17/batchnorm/add_1

+batch_normalization_17/cond/batchnorm/add/yConst%^batch_normalization_17/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_17/cond/batchnorm/add/SwitchSwitch+batch_normalization_17/moving_variance/read#batch_normalization_17/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_17/moving_variance

)batch_normalization_17/cond/batchnorm/addAdd0batch_normalization_17/cond/batchnorm/add/Switch+batch_normalization_17/cond/batchnorm/add/y*
T0
h
+batch_normalization_17/cond/batchnorm/RsqrtRsqrt)batch_normalization_17/cond/batchnorm/add*
T0
¼
0batch_normalization_17/cond/batchnorm/mul/SwitchSwitch!batch_normalization_17/gamma/read#batch_normalization_17/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_17/gamma

)batch_normalization_17/cond/batchnorm/mulMul+batch_normalization_17/cond/batchnorm/Rsqrt0batch_normalization_17/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_17/cond/batchnorm/mul_1/SwitchSwitchconv2d_17/convolution#batch_normalization_17/cond/pred_id*
T0*(
_class
loc:@conv2d_17/convolution

+batch_normalization_17/cond/batchnorm/mul_1Mul2batch_normalization_17/cond/batchnorm/mul_1/Switch)batch_normalization_17/cond/batchnorm/mul*
T0
Ê
2batch_normalization_17/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_17/moving_mean/read#batch_normalization_17/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_17/moving_mean

+batch_normalization_17/cond/batchnorm/mul_2Mul2batch_normalization_17/cond/batchnorm/mul_2/Switch)batch_normalization_17/cond/batchnorm/mul*
T0
º
0batch_normalization_17/cond/batchnorm/sub/SwitchSwitch batch_normalization_17/beta/read#batch_normalization_17/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_17/beta

)batch_normalization_17/cond/batchnorm/subSub0batch_normalization_17/cond/batchnorm/sub/Switch+batch_normalization_17/cond/batchnorm/mul_2*
T0

+batch_normalization_17/cond/batchnorm/add_1Add+batch_normalization_17/cond/batchnorm/mul_1)batch_normalization_17/cond/batchnorm/sub*
T0

!batch_normalization_17/cond/MergeMerge+batch_normalization_17/cond/batchnorm/add_1&batch_normalization_17/cond/Switch_1:1*
T0*
N
C
leakyrelu_17/NegNeg!batch_normalization_17/cond/Merge*
T0
4
leakyrelu_17/ReluReluleakyrelu_17/Neg*
T0
G
leakyrelu_17/Relu_1Relu!batch_normalization_17/cond/Merge*
T0
?
leakyrelu_17/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_17/mulMulleakyrelu_17/Constleakyrelu_17/Relu*
T0
G
leakyrelu_17/subSubleakyrelu_17/Relu_1leakyrelu_17/mul*
T0
[
conv2d_18/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_18/random_uniform/minConst*
valueB
 *«ªª¼*
dtype0
I
conv2d_18/random_uniform/maxConst*
valueB
 *«ªª<*
dtype0

&conv2d_18/random_uniform/RandomUniformRandomUniformconv2d_18/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2¸
h
conv2d_18/random_uniform/subSubconv2d_18/random_uniform/maxconv2d_18/random_uniform/min*
T0
r
conv2d_18/random_uniform/mulMul&conv2d_18/random_uniform/RandomUniformconv2d_18/random_uniform/sub*
T0
d
conv2d_18/random_uniformAddconv2d_18/random_uniform/mulconv2d_18/random_uniform/min*
T0
n
conv2d_18/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
¤
conv2d_18/kernel/AssignAssignconv2d_18/kernelconv2d_18/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_18/kernel*
validate_shape(
a
conv2d_18/kernel/readIdentityconv2d_18/kernel*
T0*#
_class
loc:@conv2d_18/kernel
:
conv2d_18/SquareSquareconv2d_18/kernel/read*
T0
<
conv2d_18/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_18/mulMulconv2d_18/mul/xconv2d_18/Square*
T0
L
conv2d_18/ConstConst*%
valueB"             *
dtype0
Z
conv2d_18/SumSumconv2d_18/mulconv2d_18/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_18/add/xConst*
valueB
 *    *
dtype0
=
conv2d_18/addAddconv2d_18/add/xconv2d_18/Sum*
T0
X
#conv2d_18/convolution/dilation_rateConst*
valueB"      *
dtype0
Ø
conv2d_18/convolutionConv2Dleakyrelu_17/subconv2d_18/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
N
batch_normalization_18/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_18/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_18/gamma/AssignAssignbatch_normalization_18/gammabatch_normalization_18/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_18/gamma*
validate_shape(

!batch_normalization_18/gamma/readIdentitybatch_normalization_18/gamma*
T0*/
_class%
#!loc:@batch_normalization_18/gamma
P
batch_normalization_18/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_18/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_18/beta/AssignAssignbatch_normalization_18/betabatch_normalization_18/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_18/beta*
validate_shape(

 batch_normalization_18/beta/readIdentitybatch_normalization_18/beta*
T0*.
_class$
" loc:@batch_normalization_18/beta
P
batch_normalization_18/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_18/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_18/moving_mean/AssignAssign"batch_normalization_18/moving_meanbatch_normalization_18/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_18/moving_mean*
validate_shape(

'batch_normalization_18/moving_mean/readIdentity"batch_normalization_18/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_18/moving_mean
P
batch_normalization_18/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_18/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_18/moving_variance/AssignAssign&batch_normalization_18/moving_variancebatch_normalization_18/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_18/moving_variance*
validate_shape(
£
+batch_normalization_18/moving_variance/readIdentity&batch_normalization_18/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_18/moving_variance
n
5batch_normalization_18/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_18/moments/meanMeanconv2d_18/convolution5batch_normalization_18/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_18/moments/StopGradientStopGradient#batch_normalization_18/moments/mean*
T0

0batch_normalization_18/moments/SquaredDifferenceSquaredDifferenceconv2d_18/convolution+batch_normalization_18/moments/StopGradient*
T0
r
9batch_normalization_18/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_18/moments/varianceMean0batch_normalization_18/moments/SquaredDifference9batch_normalization_18/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_18/moments/SqueezeSqueeze#batch_normalization_18/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_18/moments/Squeeze_1Squeeze'batch_normalization_18/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_18/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_18/batchnorm/addAdd(batch_normalization_18/moments/Squeeze_1&batch_normalization_18/batchnorm/add/y*
T0
^
&batch_normalization_18/batchnorm/RsqrtRsqrt$batch_normalization_18/batchnorm/add*
T0

$batch_normalization_18/batchnorm/mulMul&batch_normalization_18/batchnorm/Rsqrt!batch_normalization_18/gamma/read*
T0
s
&batch_normalization_18/batchnorm/mul_1Mulconv2d_18/convolution$batch_normalization_18/batchnorm/mul*
T0

&batch_normalization_18/batchnorm/mul_2Mul&batch_normalization_18/moments/Squeeze$batch_normalization_18/batchnorm/mul*
T0
~
$batch_normalization_18/batchnorm/subSub batch_normalization_18/beta/read&batch_normalization_18/batchnorm/mul_2*
T0

&batch_normalization_18/batchnorm/add_1Add&batch_normalization_18/batchnorm/mul_1$batch_normalization_18/batchnorm/sub*
T0

,batch_normalization_18/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_18/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_18/AssignMovingAvg/subSub'batch_normalization_18/moving_mean/read&batch_normalization_18/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_18/moving_mean
Ë
*batch_normalization_18/AssignMovingAvg/mulMul*batch_normalization_18/AssignMovingAvg/sub,batch_normalization_18/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_18/moving_mean
Ö
&batch_normalization_18/AssignMovingAvg	AssignSub"batch_normalization_18/moving_mean*batch_normalization_18/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_18/moving_mean

.batch_normalization_18/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_18/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_18/AssignMovingAvg_1/subSub+batch_normalization_18/moving_variance/read(batch_normalization_18/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_18/moving_variance
Õ
,batch_normalization_18/AssignMovingAvg_1/mulMul,batch_normalization_18/AssignMovingAvg_1/sub.batch_normalization_18/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_18/moving_variance
â
(batch_normalization_18/AssignMovingAvg_1	AssignSub&batch_normalization_18/moving_variance,batch_normalization_18/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_18/moving_variance

"batch_normalization_18/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_18/cond/switch_tIdentity$batch_normalization_18/cond/Switch:1*
T0

]
$batch_normalization_18/cond/switch_fIdentity"batch_normalization_18/cond/Switch*
T0

d
#batch_normalization_18/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_18/cond/Switch_1Switch&batch_normalization_18/batchnorm/add_1#batch_normalization_18/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_18/batchnorm/add_1

+batch_normalization_18/cond/batchnorm/add/yConst%^batch_normalization_18/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_18/cond/batchnorm/add/SwitchSwitch+batch_normalization_18/moving_variance/read#batch_normalization_18/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_18/moving_variance

)batch_normalization_18/cond/batchnorm/addAdd0batch_normalization_18/cond/batchnorm/add/Switch+batch_normalization_18/cond/batchnorm/add/y*
T0
h
+batch_normalization_18/cond/batchnorm/RsqrtRsqrt)batch_normalization_18/cond/batchnorm/add*
T0
¼
0batch_normalization_18/cond/batchnorm/mul/SwitchSwitch!batch_normalization_18/gamma/read#batch_normalization_18/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_18/gamma

)batch_normalization_18/cond/batchnorm/mulMul+batch_normalization_18/cond/batchnorm/Rsqrt0batch_normalization_18/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_18/cond/batchnorm/mul_1/SwitchSwitchconv2d_18/convolution#batch_normalization_18/cond/pred_id*
T0*(
_class
loc:@conv2d_18/convolution

+batch_normalization_18/cond/batchnorm/mul_1Mul2batch_normalization_18/cond/batchnorm/mul_1/Switch)batch_normalization_18/cond/batchnorm/mul*
T0
Ê
2batch_normalization_18/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_18/moving_mean/read#batch_normalization_18/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_18/moving_mean

+batch_normalization_18/cond/batchnorm/mul_2Mul2batch_normalization_18/cond/batchnorm/mul_2/Switch)batch_normalization_18/cond/batchnorm/mul*
T0
º
0batch_normalization_18/cond/batchnorm/sub/SwitchSwitch batch_normalization_18/beta/read#batch_normalization_18/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_18/beta

)batch_normalization_18/cond/batchnorm/subSub0batch_normalization_18/cond/batchnorm/sub/Switch+batch_normalization_18/cond/batchnorm/mul_2*
T0

+batch_normalization_18/cond/batchnorm/add_1Add+batch_normalization_18/cond/batchnorm/mul_1)batch_normalization_18/cond/batchnorm/sub*
T0

!batch_normalization_18/cond/MergeMerge+batch_normalization_18/cond/batchnorm/add_1&batch_normalization_18/cond/Switch_1:1*
T0*
N
C
leakyrelu_18/NegNeg!batch_normalization_18/cond/Merge*
T0
4
leakyrelu_18/ReluReluleakyrelu_18/Neg*
T0
G
leakyrelu_18/Relu_1Relu!batch_normalization_18/cond/Merge*
T0
?
leakyrelu_18/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_18/mulMulleakyrelu_18/Constleakyrelu_18/Relu*
T0
G
leakyrelu_18/subSubleakyrelu_18/Relu_1leakyrelu_18/mul*
T0
[
conv2d_19/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_19/random_uniform/minConst*
valueB
 *:Í¼*
dtype0
I
conv2d_19/random_uniform/maxConst*
valueB
 *:Í<*
dtype0

&conv2d_19/random_uniform/RandomUniformRandomUniformconv2d_19/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2¨
h
conv2d_19/random_uniform/subSubconv2d_19/random_uniform/maxconv2d_19/random_uniform/min*
T0
r
conv2d_19/random_uniform/mulMul&conv2d_19/random_uniform/RandomUniformconv2d_19/random_uniform/sub*
T0
d
conv2d_19/random_uniformAddconv2d_19/random_uniform/mulconv2d_19/random_uniform/min*
T0
n
conv2d_19/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
¤
conv2d_19/kernel/AssignAssignconv2d_19/kernelconv2d_19/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_19/kernel*
validate_shape(
a
conv2d_19/kernel/readIdentityconv2d_19/kernel*
T0*#
_class
loc:@conv2d_19/kernel
:
conv2d_19/SquareSquareconv2d_19/kernel/read*
T0
<
conv2d_19/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_19/mulMulconv2d_19/mul/xconv2d_19/Square*
T0
L
conv2d_19/ConstConst*%
valueB"             *
dtype0
Z
conv2d_19/SumSumconv2d_19/mulconv2d_19/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_19/add/xConst*
valueB
 *    *
dtype0
=
conv2d_19/addAddconv2d_19/add/xconv2d_19/Sum*
T0
X
#conv2d_19/convolution/dilation_rateConst*
valueB"      *
dtype0
Ø
conv2d_19/convolutionConv2Dleakyrelu_18/subconv2d_19/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
N
batch_normalization_19/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_19/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_19/gamma/AssignAssignbatch_normalization_19/gammabatch_normalization_19/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_19/gamma*
validate_shape(

!batch_normalization_19/gamma/readIdentitybatch_normalization_19/gamma*
T0*/
_class%
#!loc:@batch_normalization_19/gamma
P
batch_normalization_19/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_19/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_19/beta/AssignAssignbatch_normalization_19/betabatch_normalization_19/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_19/beta*
validate_shape(

 batch_normalization_19/beta/readIdentitybatch_normalization_19/beta*
T0*.
_class$
" loc:@batch_normalization_19/beta
P
batch_normalization_19/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_19/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_19/moving_mean/AssignAssign"batch_normalization_19/moving_meanbatch_normalization_19/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_19/moving_mean*
validate_shape(

'batch_normalization_19/moving_mean/readIdentity"batch_normalization_19/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_19/moving_mean
P
batch_normalization_19/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_19/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_19/moving_variance/AssignAssign&batch_normalization_19/moving_variancebatch_normalization_19/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_19/moving_variance*
validate_shape(
£
+batch_normalization_19/moving_variance/readIdentity&batch_normalization_19/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_19/moving_variance
n
5batch_normalization_19/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_19/moments/meanMeanconv2d_19/convolution5batch_normalization_19/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_19/moments/StopGradientStopGradient#batch_normalization_19/moments/mean*
T0

0batch_normalization_19/moments/SquaredDifferenceSquaredDifferenceconv2d_19/convolution+batch_normalization_19/moments/StopGradient*
T0
r
9batch_normalization_19/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_19/moments/varianceMean0batch_normalization_19/moments/SquaredDifference9batch_normalization_19/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_19/moments/SqueezeSqueeze#batch_normalization_19/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_19/moments/Squeeze_1Squeeze'batch_normalization_19/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_19/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_19/batchnorm/addAdd(batch_normalization_19/moments/Squeeze_1&batch_normalization_19/batchnorm/add/y*
T0
^
&batch_normalization_19/batchnorm/RsqrtRsqrt$batch_normalization_19/batchnorm/add*
T0

$batch_normalization_19/batchnorm/mulMul&batch_normalization_19/batchnorm/Rsqrt!batch_normalization_19/gamma/read*
T0
s
&batch_normalization_19/batchnorm/mul_1Mulconv2d_19/convolution$batch_normalization_19/batchnorm/mul*
T0

&batch_normalization_19/batchnorm/mul_2Mul&batch_normalization_19/moments/Squeeze$batch_normalization_19/batchnorm/mul*
T0
~
$batch_normalization_19/batchnorm/subSub batch_normalization_19/beta/read&batch_normalization_19/batchnorm/mul_2*
T0

&batch_normalization_19/batchnorm/add_1Add&batch_normalization_19/batchnorm/mul_1$batch_normalization_19/batchnorm/sub*
T0

,batch_normalization_19/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_19/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_19/AssignMovingAvg/subSub'batch_normalization_19/moving_mean/read&batch_normalization_19/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_19/moving_mean
Ë
*batch_normalization_19/AssignMovingAvg/mulMul*batch_normalization_19/AssignMovingAvg/sub,batch_normalization_19/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_19/moving_mean
Ö
&batch_normalization_19/AssignMovingAvg	AssignSub"batch_normalization_19/moving_mean*batch_normalization_19/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_19/moving_mean

.batch_normalization_19/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_19/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_19/AssignMovingAvg_1/subSub+batch_normalization_19/moving_variance/read(batch_normalization_19/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_19/moving_variance
Õ
,batch_normalization_19/AssignMovingAvg_1/mulMul,batch_normalization_19/AssignMovingAvg_1/sub.batch_normalization_19/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_19/moving_variance
â
(batch_normalization_19/AssignMovingAvg_1	AssignSub&batch_normalization_19/moving_variance,batch_normalization_19/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_19/moving_variance

"batch_normalization_19/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_19/cond/switch_tIdentity$batch_normalization_19/cond/Switch:1*
T0

]
$batch_normalization_19/cond/switch_fIdentity"batch_normalization_19/cond/Switch*
T0

d
#batch_normalization_19/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_19/cond/Switch_1Switch&batch_normalization_19/batchnorm/add_1#batch_normalization_19/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_19/batchnorm/add_1

+batch_normalization_19/cond/batchnorm/add/yConst%^batch_normalization_19/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_19/cond/batchnorm/add/SwitchSwitch+batch_normalization_19/moving_variance/read#batch_normalization_19/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_19/moving_variance

)batch_normalization_19/cond/batchnorm/addAdd0batch_normalization_19/cond/batchnorm/add/Switch+batch_normalization_19/cond/batchnorm/add/y*
T0
h
+batch_normalization_19/cond/batchnorm/RsqrtRsqrt)batch_normalization_19/cond/batchnorm/add*
T0
¼
0batch_normalization_19/cond/batchnorm/mul/SwitchSwitch!batch_normalization_19/gamma/read#batch_normalization_19/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_19/gamma

)batch_normalization_19/cond/batchnorm/mulMul+batch_normalization_19/cond/batchnorm/Rsqrt0batch_normalization_19/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_19/cond/batchnorm/mul_1/SwitchSwitchconv2d_19/convolution#batch_normalization_19/cond/pred_id*
T0*(
_class
loc:@conv2d_19/convolution

+batch_normalization_19/cond/batchnorm/mul_1Mul2batch_normalization_19/cond/batchnorm/mul_1/Switch)batch_normalization_19/cond/batchnorm/mul*
T0
Ê
2batch_normalization_19/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_19/moving_mean/read#batch_normalization_19/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_19/moving_mean

+batch_normalization_19/cond/batchnorm/mul_2Mul2batch_normalization_19/cond/batchnorm/mul_2/Switch)batch_normalization_19/cond/batchnorm/mul*
T0
º
0batch_normalization_19/cond/batchnorm/sub/SwitchSwitch batch_normalization_19/beta/read#batch_normalization_19/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_19/beta

)batch_normalization_19/cond/batchnorm/subSub0batch_normalization_19/cond/batchnorm/sub/Switch+batch_normalization_19/cond/batchnorm/mul_2*
T0

+batch_normalization_19/cond/batchnorm/add_1Add+batch_normalization_19/cond/batchnorm/mul_1)batch_normalization_19/cond/batchnorm/sub*
T0

!batch_normalization_19/cond/MergeMerge+batch_normalization_19/cond/batchnorm/add_1&batch_normalization_19/cond/Switch_1:1*
T0*
N
[
conv2d_21/random_uniform/shapeConst*%
valueB"         @   *
dtype0
I
conv2d_21/random_uniform/minConst*
valueB
 *ìÑ½*
dtype0
I
conv2d_21/random_uniform/maxConst*
valueB
 *ìÑ=*
dtype0

&conv2d_21/random_uniform/RandomUniformRandomUniformconv2d_21/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed26
h
conv2d_21/random_uniform/subSubconv2d_21/random_uniform/maxconv2d_21/random_uniform/min*
T0
r
conv2d_21/random_uniform/mulMul&conv2d_21/random_uniform/RandomUniformconv2d_21/random_uniform/sub*
T0
d
conv2d_21/random_uniformAddconv2d_21/random_uniform/mulconv2d_21/random_uniform/min*
T0
m
conv2d_21/kernel
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
¤
conv2d_21/kernel/AssignAssignconv2d_21/kernelconv2d_21/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_21/kernel*
validate_shape(
a
conv2d_21/kernel/readIdentityconv2d_21/kernel*
T0*#
_class
loc:@conv2d_21/kernel
:
conv2d_21/SquareSquareconv2d_21/kernel/read*
T0
<
conv2d_21/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_21/mulMulconv2d_21/mul/xconv2d_21/Square*
T0
L
conv2d_21/ConstConst*%
valueB"             *
dtype0
Z
conv2d_21/SumSumconv2d_21/mulconv2d_21/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_21/add/xConst*
valueB
 *    *
dtype0
=
conv2d_21/addAddconv2d_21/add/xconv2d_21/Sum*
T0
X
#conv2d_21/convolution/dilation_rateConst*
valueB"      *
dtype0
Ø
conv2d_21/convolutionConv2Dleakyrelu_13/subconv2d_21/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
C
leakyrelu_19/NegNeg!batch_normalization_19/cond/Merge*
T0
4
leakyrelu_19/ReluReluleakyrelu_19/Neg*
T0
G
leakyrelu_19/Relu_1Relu!batch_normalization_19/cond/Merge*
T0
?
leakyrelu_19/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_19/mulMulleakyrelu_19/Constleakyrelu_19/Relu*
T0
G
leakyrelu_19/subSubleakyrelu_19/Relu_1leakyrelu_19/mul*
T0
M
batch_normalization_21/ConstConst*
valueB@*  ?*
dtype0
l
batch_normalization_21/gamma
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_21/gamma/AssignAssignbatch_normalization_21/gammabatch_normalization_21/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_21/gamma*
validate_shape(

!batch_normalization_21/gamma/readIdentitybatch_normalization_21/gamma*
T0*/
_class%
#!loc:@batch_normalization_21/gamma
O
batch_normalization_21/Const_1Const*
valueB@*    *
dtype0
k
batch_normalization_21/beta
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_21/beta/AssignAssignbatch_normalization_21/betabatch_normalization_21/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_21/beta*
validate_shape(

 batch_normalization_21/beta/readIdentitybatch_normalization_21/beta*
T0*.
_class$
" loc:@batch_normalization_21/beta
O
batch_normalization_21/Const_2Const*
valueB@*    *
dtype0
r
"batch_normalization_21/moving_mean
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
à
)batch_normalization_21/moving_mean/AssignAssign"batch_normalization_21/moving_meanbatch_normalization_21/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_21/moving_mean*
validate_shape(

'batch_normalization_21/moving_mean/readIdentity"batch_normalization_21/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_21/moving_mean
O
batch_normalization_21/Const_3Const*
valueB@*  ?*
dtype0
v
&batch_normalization_21/moving_variance
VariableV2*
shape:@*
shared_name *
dtype0*
	container 
ì
-batch_normalization_21/moving_variance/AssignAssign&batch_normalization_21/moving_variancebatch_normalization_21/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_21/moving_variance*
validate_shape(
£
+batch_normalization_21/moving_variance/readIdentity&batch_normalization_21/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_21/moving_variance
n
5batch_normalization_21/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_21/moments/meanMeanconv2d_21/convolution5batch_normalization_21/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_21/moments/StopGradientStopGradient#batch_normalization_21/moments/mean*
T0

0batch_normalization_21/moments/SquaredDifferenceSquaredDifferenceconv2d_21/convolution+batch_normalization_21/moments/StopGradient*
T0
r
9batch_normalization_21/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_21/moments/varianceMean0batch_normalization_21/moments/SquaredDifference9batch_normalization_21/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_21/moments/SqueezeSqueeze#batch_normalization_21/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_21/moments/Squeeze_1Squeeze'batch_normalization_21/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_21/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_21/batchnorm/addAdd(batch_normalization_21/moments/Squeeze_1&batch_normalization_21/batchnorm/add/y*
T0
^
&batch_normalization_21/batchnorm/RsqrtRsqrt$batch_normalization_21/batchnorm/add*
T0

$batch_normalization_21/batchnorm/mulMul&batch_normalization_21/batchnorm/Rsqrt!batch_normalization_21/gamma/read*
T0
s
&batch_normalization_21/batchnorm/mul_1Mulconv2d_21/convolution$batch_normalization_21/batchnorm/mul*
T0

&batch_normalization_21/batchnorm/mul_2Mul&batch_normalization_21/moments/Squeeze$batch_normalization_21/batchnorm/mul*
T0
~
$batch_normalization_21/batchnorm/subSub batch_normalization_21/beta/read&batch_normalization_21/batchnorm/mul_2*
T0

&batch_normalization_21/batchnorm/add_1Add&batch_normalization_21/batchnorm/mul_1$batch_normalization_21/batchnorm/sub*
T0

,batch_normalization_21/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_21/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_21/AssignMovingAvg/subSub'batch_normalization_21/moving_mean/read&batch_normalization_21/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_21/moving_mean
Ë
*batch_normalization_21/AssignMovingAvg/mulMul*batch_normalization_21/AssignMovingAvg/sub,batch_normalization_21/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_21/moving_mean
Ö
&batch_normalization_21/AssignMovingAvg	AssignSub"batch_normalization_21/moving_mean*batch_normalization_21/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_21/moving_mean

.batch_normalization_21/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_21/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_21/AssignMovingAvg_1/subSub+batch_normalization_21/moving_variance/read(batch_normalization_21/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_21/moving_variance
Õ
,batch_normalization_21/AssignMovingAvg_1/mulMul,batch_normalization_21/AssignMovingAvg_1/sub.batch_normalization_21/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_21/moving_variance
â
(batch_normalization_21/AssignMovingAvg_1	AssignSub&batch_normalization_21/moving_variance,batch_normalization_21/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_21/moving_variance

"batch_normalization_21/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_21/cond/switch_tIdentity$batch_normalization_21/cond/Switch:1*
T0

]
$batch_normalization_21/cond/switch_fIdentity"batch_normalization_21/cond/Switch*
T0

d
#batch_normalization_21/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_21/cond/Switch_1Switch&batch_normalization_21/batchnorm/add_1#batch_normalization_21/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_21/batchnorm/add_1

+batch_normalization_21/cond/batchnorm/add/yConst%^batch_normalization_21/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_21/cond/batchnorm/add/SwitchSwitch+batch_normalization_21/moving_variance/read#batch_normalization_21/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_21/moving_variance

)batch_normalization_21/cond/batchnorm/addAdd0batch_normalization_21/cond/batchnorm/add/Switch+batch_normalization_21/cond/batchnorm/add/y*
T0
h
+batch_normalization_21/cond/batchnorm/RsqrtRsqrt)batch_normalization_21/cond/batchnorm/add*
T0
¼
0batch_normalization_21/cond/batchnorm/mul/SwitchSwitch!batch_normalization_21/gamma/read#batch_normalization_21/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_21/gamma

)batch_normalization_21/cond/batchnorm/mulMul+batch_normalization_21/cond/batchnorm/Rsqrt0batch_normalization_21/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_21/cond/batchnorm/mul_1/SwitchSwitchconv2d_21/convolution#batch_normalization_21/cond/pred_id*
T0*(
_class
loc:@conv2d_21/convolution

+batch_normalization_21/cond/batchnorm/mul_1Mul2batch_normalization_21/cond/batchnorm/mul_1/Switch)batch_normalization_21/cond/batchnorm/mul*
T0
Ê
2batch_normalization_21/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_21/moving_mean/read#batch_normalization_21/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_21/moving_mean

+batch_normalization_21/cond/batchnorm/mul_2Mul2batch_normalization_21/cond/batchnorm/mul_2/Switch)batch_normalization_21/cond/batchnorm/mul*
T0
º
0batch_normalization_21/cond/batchnorm/sub/SwitchSwitch batch_normalization_21/beta/read#batch_normalization_21/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_21/beta

)batch_normalization_21/cond/batchnorm/subSub0batch_normalization_21/cond/batchnorm/sub/Switch+batch_normalization_21/cond/batchnorm/mul_2*
T0

+batch_normalization_21/cond/batchnorm/add_1Add+batch_normalization_21/cond/batchnorm/mul_1)batch_normalization_21/cond/batchnorm/sub*
T0

!batch_normalization_21/cond/MergeMerge+batch_normalization_21/cond/batchnorm/add_1&batch_normalization_21/cond/Switch_1:1*
T0*
N
[
conv2d_20/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_20/random_uniform/minConst*
valueB
 *:Í¼*
dtype0
I
conv2d_20/random_uniform/maxConst*
valueB
 *:Í<*
dtype0

&conv2d_20/random_uniform/RandomUniformRandomUniformconv2d_20/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2××
h
conv2d_20/random_uniform/subSubconv2d_20/random_uniform/maxconv2d_20/random_uniform/min*
T0
r
conv2d_20/random_uniform/mulMul&conv2d_20/random_uniform/RandomUniformconv2d_20/random_uniform/sub*
T0
d
conv2d_20/random_uniformAddconv2d_20/random_uniform/mulconv2d_20/random_uniform/min*
T0
n
conv2d_20/kernel
VariableV2*
shape:*
shared_name *
dtype0*
	container 
¤
conv2d_20/kernel/AssignAssignconv2d_20/kernelconv2d_20/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_20/kernel*
validate_shape(
a
conv2d_20/kernel/readIdentityconv2d_20/kernel*
T0*#
_class
loc:@conv2d_20/kernel
:
conv2d_20/SquareSquareconv2d_20/kernel/read*
T0
<
conv2d_20/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_20/mulMulconv2d_20/mul/xconv2d_20/Square*
T0
L
conv2d_20/ConstConst*%
valueB"             *
dtype0
Z
conv2d_20/SumSumconv2d_20/mulconv2d_20/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_20/add/xConst*
valueB
 *    *
dtype0
=
conv2d_20/addAddconv2d_20/add/xconv2d_20/Sum*
T0
X
#conv2d_20/convolution/dilation_rateConst*
valueB"      *
dtype0
Ø
conv2d_20/convolutionConv2Dleakyrelu_19/subconv2d_20/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
C
leakyrelu_21/NegNeg!batch_normalization_21/cond/Merge*
T0
4
leakyrelu_21/ReluReluleakyrelu_21/Neg*
T0
G
leakyrelu_21/Relu_1Relu!batch_normalization_21/cond/Merge*
T0
?
leakyrelu_21/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_21/mulMulleakyrelu_21/Constleakyrelu_21/Relu*
T0
G
leakyrelu_21/subSubleakyrelu_21/Relu_1leakyrelu_21/mul*
T0
N
batch_normalization_20/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_20/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_20/gamma/AssignAssignbatch_normalization_20/gammabatch_normalization_20/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_20/gamma*
validate_shape(

!batch_normalization_20/gamma/readIdentitybatch_normalization_20/gamma*
T0*/
_class%
#!loc:@batch_normalization_20/gamma
P
batch_normalization_20/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_20/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_20/beta/AssignAssignbatch_normalization_20/betabatch_normalization_20/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_20/beta*
validate_shape(

 batch_normalization_20/beta/readIdentitybatch_normalization_20/beta*
T0*.
_class$
" loc:@batch_normalization_20/beta
P
batch_normalization_20/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_20/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_20/moving_mean/AssignAssign"batch_normalization_20/moving_meanbatch_normalization_20/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_20/moving_mean*
validate_shape(

'batch_normalization_20/moving_mean/readIdentity"batch_normalization_20/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_20/moving_mean
P
batch_normalization_20/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_20/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_20/moving_variance/AssignAssign&batch_normalization_20/moving_variancebatch_normalization_20/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_20/moving_variance*
validate_shape(
£
+batch_normalization_20/moving_variance/readIdentity&batch_normalization_20/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_20/moving_variance
n
5batch_normalization_20/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_20/moments/meanMeanconv2d_20/convolution5batch_normalization_20/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_20/moments/StopGradientStopGradient#batch_normalization_20/moments/mean*
T0

0batch_normalization_20/moments/SquaredDifferenceSquaredDifferenceconv2d_20/convolution+batch_normalization_20/moments/StopGradient*
T0
r
9batch_normalization_20/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_20/moments/varianceMean0batch_normalization_20/moments/SquaredDifference9batch_normalization_20/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_20/moments/SqueezeSqueeze#batch_normalization_20/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_20/moments/Squeeze_1Squeeze'batch_normalization_20/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_20/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_20/batchnorm/addAdd(batch_normalization_20/moments/Squeeze_1&batch_normalization_20/batchnorm/add/y*
T0
^
&batch_normalization_20/batchnorm/RsqrtRsqrt$batch_normalization_20/batchnorm/add*
T0

$batch_normalization_20/batchnorm/mulMul&batch_normalization_20/batchnorm/Rsqrt!batch_normalization_20/gamma/read*
T0
s
&batch_normalization_20/batchnorm/mul_1Mulconv2d_20/convolution$batch_normalization_20/batchnorm/mul*
T0

&batch_normalization_20/batchnorm/mul_2Mul&batch_normalization_20/moments/Squeeze$batch_normalization_20/batchnorm/mul*
T0
~
$batch_normalization_20/batchnorm/subSub batch_normalization_20/beta/read&batch_normalization_20/batchnorm/mul_2*
T0

&batch_normalization_20/batchnorm/add_1Add&batch_normalization_20/batchnorm/mul_1$batch_normalization_20/batchnorm/sub*
T0

,batch_normalization_20/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_20/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_20/AssignMovingAvg/subSub'batch_normalization_20/moving_mean/read&batch_normalization_20/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_20/moving_mean
Ë
*batch_normalization_20/AssignMovingAvg/mulMul*batch_normalization_20/AssignMovingAvg/sub,batch_normalization_20/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_20/moving_mean
Ö
&batch_normalization_20/AssignMovingAvg	AssignSub"batch_normalization_20/moving_mean*batch_normalization_20/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_20/moving_mean

.batch_normalization_20/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_20/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_20/AssignMovingAvg_1/subSub+batch_normalization_20/moving_variance/read(batch_normalization_20/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_20/moving_variance
Õ
,batch_normalization_20/AssignMovingAvg_1/mulMul,batch_normalization_20/AssignMovingAvg_1/sub.batch_normalization_20/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_20/moving_variance
â
(batch_normalization_20/AssignMovingAvg_1	AssignSub&batch_normalization_20/moving_variance,batch_normalization_20/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_20/moving_variance

"batch_normalization_20/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_20/cond/switch_tIdentity$batch_normalization_20/cond/Switch:1*
T0

]
$batch_normalization_20/cond/switch_fIdentity"batch_normalization_20/cond/Switch*
T0

d
#batch_normalization_20/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_20/cond/Switch_1Switch&batch_normalization_20/batchnorm/add_1#batch_normalization_20/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_20/batchnorm/add_1

+batch_normalization_20/cond/batchnorm/add/yConst%^batch_normalization_20/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_20/cond/batchnorm/add/SwitchSwitch+batch_normalization_20/moving_variance/read#batch_normalization_20/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_20/moving_variance

)batch_normalization_20/cond/batchnorm/addAdd0batch_normalization_20/cond/batchnorm/add/Switch+batch_normalization_20/cond/batchnorm/add/y*
T0
h
+batch_normalization_20/cond/batchnorm/RsqrtRsqrt)batch_normalization_20/cond/batchnorm/add*
T0
¼
0batch_normalization_20/cond/batchnorm/mul/SwitchSwitch!batch_normalization_20/gamma/read#batch_normalization_20/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_20/gamma

)batch_normalization_20/cond/batchnorm/mulMul+batch_normalization_20/cond/batchnorm/Rsqrt0batch_normalization_20/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_20/cond/batchnorm/mul_1/SwitchSwitchconv2d_20/convolution#batch_normalization_20/cond/pred_id*
T0*(
_class
loc:@conv2d_20/convolution

+batch_normalization_20/cond/batchnorm/mul_1Mul2batch_normalization_20/cond/batchnorm/mul_1/Switch)batch_normalization_20/cond/batchnorm/mul*
T0
Ê
2batch_normalization_20/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_20/moving_mean/read#batch_normalization_20/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_20/moving_mean

+batch_normalization_20/cond/batchnorm/mul_2Mul2batch_normalization_20/cond/batchnorm/mul_2/Switch)batch_normalization_20/cond/batchnorm/mul*
T0
º
0batch_normalization_20/cond/batchnorm/sub/SwitchSwitch batch_normalization_20/beta/read#batch_normalization_20/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_20/beta

)batch_normalization_20/cond/batchnorm/subSub0batch_normalization_20/cond/batchnorm/sub/Switch+batch_normalization_20/cond/batchnorm/mul_2*
T0

+batch_normalization_20/cond/batchnorm/add_1Add+batch_normalization_20/cond/batchnorm/mul_1)batch_normalization_20/cond/batchnorm/sub*
T0

!batch_normalization_20/cond/MergeMerge+batch_normalization_20/cond/batchnorm/add_1&batch_normalization_20/cond/Switch_1:1*
T0*
N
q
space_to_depth_2/SpaceToDepthSpaceToDepthleakyrelu_21/sub*

block_size*
T0*
data_formatNHWC
C
leakyrelu_20/NegNeg!batch_normalization_20/cond/Merge*
T0
4
leakyrelu_20/ReluReluleakyrelu_20/Neg*
T0
G
leakyrelu_20/Relu_1Relu!batch_normalization_20/cond/Merge*
T0
?
leakyrelu_20/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_20/mulMulleakyrelu_20/Constleakyrelu_20/Relu*
T0
G
leakyrelu_20/subSubleakyrelu_20/Relu_1leakyrelu_20/mul*
T0
=
merge_1/concat/axisConst*
value	B :*
dtype0
~
merge_1/concatConcatV2space_to_depth_2/SpaceToDepthleakyrelu_20/submerge_1/concat/axis*

Tidx0*
T0*
N
[
conv2d_22/random_uniform/shapeConst*%
valueB"            *
dtype0
I
conv2d_22/random_uniform/minConst*
valueB
 *HY¼*
dtype0
I
conv2d_22/random_uniform/maxConst*
valueB
 *HY<*
dtype0

&conv2d_22/random_uniform/RandomUniformRandomUniformconv2d_22/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2Èÿ7
h
conv2d_22/random_uniform/subSubconv2d_22/random_uniform/maxconv2d_22/random_uniform/min*
T0
r
conv2d_22/random_uniform/mulMul&conv2d_22/random_uniform/RandomUniformconv2d_22/random_uniform/sub*
T0
d
conv2d_22/random_uniformAddconv2d_22/random_uniform/mulconv2d_22/random_uniform/min*
T0
n
conv2d_22/kernel
VariableV2*
shape:
*
shared_name *
dtype0*
	container 
¤
conv2d_22/kernel/AssignAssignconv2d_22/kernelconv2d_22/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_22/kernel*
validate_shape(
a
conv2d_22/kernel/readIdentityconv2d_22/kernel*
T0*#
_class
loc:@conv2d_22/kernel
:
conv2d_22/SquareSquareconv2d_22/kernel/read*
T0
<
conv2d_22/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_22/mulMulconv2d_22/mul/xconv2d_22/Square*
T0
L
conv2d_22/ConstConst*%
valueB"             *
dtype0
Z
conv2d_22/SumSumconv2d_22/mulconv2d_22/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_22/add/xConst*
valueB
 *    *
dtype0
=
conv2d_22/addAddconv2d_22/add/xconv2d_22/Sum*
T0
X
#conv2d_22/convolution/dilation_rateConst*
valueB"      *
dtype0
Ö
conv2d_22/convolutionConv2Dmerge_1/concatconv2d_22/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
N
batch_normalization_22/ConstConst*
valueB*  ?*
dtype0
m
batch_normalization_22/gamma
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ì
#batch_normalization_22/gamma/AssignAssignbatch_normalization_22/gammabatch_normalization_22/Const*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_22/gamma*
validate_shape(

!batch_normalization_22/gamma/readIdentitybatch_normalization_22/gamma*
T0*/
_class%
#!loc:@batch_normalization_22/gamma
P
batch_normalization_22/Const_1Const*
valueB*    *
dtype0
l
batch_normalization_22/beta
VariableV2*
shape:*
shared_name *
dtype0*
	container 
Ë
"batch_normalization_22/beta/AssignAssignbatch_normalization_22/betabatch_normalization_22/Const_1*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_22/beta*
validate_shape(

 batch_normalization_22/beta/readIdentitybatch_normalization_22/beta*
T0*.
_class$
" loc:@batch_normalization_22/beta
P
batch_normalization_22/Const_2Const*
valueB*    *
dtype0
s
"batch_normalization_22/moving_mean
VariableV2*
shape:*
shared_name *
dtype0*
	container 
à
)batch_normalization_22/moving_mean/AssignAssign"batch_normalization_22/moving_meanbatch_normalization_22/Const_2*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_22/moving_mean*
validate_shape(

'batch_normalization_22/moving_mean/readIdentity"batch_normalization_22/moving_mean*
T0*5
_class+
)'loc:@batch_normalization_22/moving_mean
P
batch_normalization_22/Const_3Const*
valueB*  ?*
dtype0
w
&batch_normalization_22/moving_variance
VariableV2*
shape:*
shared_name *
dtype0*
	container 
ì
-batch_normalization_22/moving_variance/AssignAssign&batch_normalization_22/moving_variancebatch_normalization_22/Const_3*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_22/moving_variance*
validate_shape(
£
+batch_normalization_22/moving_variance/readIdentity&batch_normalization_22/moving_variance*
T0*9
_class/
-+loc:@batch_normalization_22/moving_variance
n
5batch_normalization_22/moments/mean/reduction_indicesConst*!
valueB"          *
dtype0

#batch_normalization_22/moments/meanMeanconv2d_22/convolution5batch_normalization_22/moments/mean/reduction_indices*

Tidx0*
	keep_dims(*
T0
i
+batch_normalization_22/moments/StopGradientStopGradient#batch_normalization_22/moments/mean*
T0

0batch_normalization_22/moments/SquaredDifferenceSquaredDifferenceconv2d_22/convolution+batch_normalization_22/moments/StopGradient*
T0
r
9batch_normalization_22/moments/variance/reduction_indicesConst*!
valueB"          *
dtype0
Â
'batch_normalization_22/moments/varianceMean0batch_normalization_22/moments/SquaredDifference9batch_normalization_22/moments/variance/reduction_indices*

Tidx0*
	keep_dims(*
T0
x
&batch_normalization_22/moments/SqueezeSqueeze#batch_normalization_22/moments/mean*
squeeze_dims
 *
T0
~
(batch_normalization_22/moments/Squeeze_1Squeeze'batch_normalization_22/moments/variance*
squeeze_dims
 *
T0
S
&batch_normalization_22/batchnorm/add/yConst*
valueB
 *o:*
dtype0

$batch_normalization_22/batchnorm/addAdd(batch_normalization_22/moments/Squeeze_1&batch_normalization_22/batchnorm/add/y*
T0
^
&batch_normalization_22/batchnorm/RsqrtRsqrt$batch_normalization_22/batchnorm/add*
T0

$batch_normalization_22/batchnorm/mulMul&batch_normalization_22/batchnorm/Rsqrt!batch_normalization_22/gamma/read*
T0
s
&batch_normalization_22/batchnorm/mul_1Mulconv2d_22/convolution$batch_normalization_22/batchnorm/mul*
T0

&batch_normalization_22/batchnorm/mul_2Mul&batch_normalization_22/moments/Squeeze$batch_normalization_22/batchnorm/mul*
T0
~
$batch_normalization_22/batchnorm/subSub batch_normalization_22/beta/read&batch_normalization_22/batchnorm/mul_2*
T0

&batch_normalization_22/batchnorm/add_1Add&batch_normalization_22/batchnorm/mul_1$batch_normalization_22/batchnorm/sub*
T0

,batch_normalization_22/AssignMovingAvg/decayConst*5
_class+
)'loc:@batch_normalization_22/moving_mean*
valueB
 *
×#<*
dtype0
Â
*batch_normalization_22/AssignMovingAvg/subSub'batch_normalization_22/moving_mean/read&batch_normalization_22/moments/Squeeze*
T0*5
_class+
)'loc:@batch_normalization_22/moving_mean
Ë
*batch_normalization_22/AssignMovingAvg/mulMul*batch_normalization_22/AssignMovingAvg/sub,batch_normalization_22/AssignMovingAvg/decay*
T0*5
_class+
)'loc:@batch_normalization_22/moving_mean
Ö
&batch_normalization_22/AssignMovingAvg	AssignSub"batch_normalization_22/moving_mean*batch_normalization_22/AssignMovingAvg/mul*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_22/moving_mean

.batch_normalization_22/AssignMovingAvg_1/decayConst*9
_class/
-+loc:@batch_normalization_22/moving_variance*
valueB
 *
×#<*
dtype0
Î
,batch_normalization_22/AssignMovingAvg_1/subSub+batch_normalization_22/moving_variance/read(batch_normalization_22/moments/Squeeze_1*
T0*9
_class/
-+loc:@batch_normalization_22/moving_variance
Õ
,batch_normalization_22/AssignMovingAvg_1/mulMul,batch_normalization_22/AssignMovingAvg_1/sub.batch_normalization_22/AssignMovingAvg_1/decay*
T0*9
_class/
-+loc:@batch_normalization_22/moving_variance
â
(batch_normalization_22/AssignMovingAvg_1	AssignSub&batch_normalization_22/moving_variance,batch_normalization_22/AssignMovingAvg_1/mul*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_22/moving_variance

"batch_normalization_22/cond/SwitchSwitch*batch_normalization_1/keras_learning_phase*batch_normalization_1/keras_learning_phase*
T0

_
$batch_normalization_22/cond/switch_tIdentity$batch_normalization_22/cond/Switch:1*
T0

]
$batch_normalization_22/cond/switch_fIdentity"batch_normalization_22/cond/Switch*
T0

d
#batch_normalization_22/cond/pred_idIdentity*batch_normalization_1/keras_learning_phase*
T0

¿
$batch_normalization_22/cond/Switch_1Switch&batch_normalization_22/batchnorm/add_1#batch_normalization_22/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_22/batchnorm/add_1

+batch_normalization_22/cond/batchnorm/add/yConst%^batch_normalization_22/cond/switch_f*
valueB
 *o:*
dtype0
Ð
0batch_normalization_22/cond/batchnorm/add/SwitchSwitch+batch_normalization_22/moving_variance/read#batch_normalization_22/cond/pred_id*
T0*9
_class/
-+loc:@batch_normalization_22/moving_variance

)batch_normalization_22/cond/batchnorm/addAdd0batch_normalization_22/cond/batchnorm/add/Switch+batch_normalization_22/cond/batchnorm/add/y*
T0
h
+batch_normalization_22/cond/batchnorm/RsqrtRsqrt)batch_normalization_22/cond/batchnorm/add*
T0
¼
0batch_normalization_22/cond/batchnorm/mul/SwitchSwitch!batch_normalization_22/gamma/read#batch_normalization_22/cond/pred_id*
T0*/
_class%
#!loc:@batch_normalization_22/gamma

)batch_normalization_22/cond/batchnorm/mulMul+batch_normalization_22/cond/batchnorm/Rsqrt0batch_normalization_22/cond/batchnorm/mul/Switch*
T0
«
2batch_normalization_22/cond/batchnorm/mul_1/SwitchSwitchconv2d_22/convolution#batch_normalization_22/cond/pred_id*
T0*(
_class
loc:@conv2d_22/convolution

+batch_normalization_22/cond/batchnorm/mul_1Mul2batch_normalization_22/cond/batchnorm/mul_1/Switch)batch_normalization_22/cond/batchnorm/mul*
T0
Ê
2batch_normalization_22/cond/batchnorm/mul_2/SwitchSwitch'batch_normalization_22/moving_mean/read#batch_normalization_22/cond/pred_id*
T0*5
_class+
)'loc:@batch_normalization_22/moving_mean

+batch_normalization_22/cond/batchnorm/mul_2Mul2batch_normalization_22/cond/batchnorm/mul_2/Switch)batch_normalization_22/cond/batchnorm/mul*
T0
º
0batch_normalization_22/cond/batchnorm/sub/SwitchSwitch batch_normalization_22/beta/read#batch_normalization_22/cond/pred_id*
T0*.
_class$
" loc:@batch_normalization_22/beta

)batch_normalization_22/cond/batchnorm/subSub0batch_normalization_22/cond/batchnorm/sub/Switch+batch_normalization_22/cond/batchnorm/mul_2*
T0

+batch_normalization_22/cond/batchnorm/add_1Add+batch_normalization_22/cond/batchnorm/mul_1)batch_normalization_22/cond/batchnorm/sub*
T0

!batch_normalization_22/cond/MergeMerge+batch_normalization_22/cond/batchnorm/add_1&batch_normalization_22/cond/Switch_1:1*
T0*
N
C
leakyrelu_22/NegNeg!batch_normalization_22/cond/Merge*
T0
4
leakyrelu_22/ReluReluleakyrelu_22/Neg*
T0
G
leakyrelu_22/Relu_1Relu!batch_normalization_22/cond/Merge*
T0
?
leakyrelu_22/ConstConst*
valueB
 *ÍÌÌ=*
dtype0
G
leakyrelu_22/mulMulleakyrelu_22/Constleakyrelu_22/Relu*
T0
G
leakyrelu_22/subSubleakyrelu_22/Relu_1leakyrelu_22/mul*
T0
[
conv2d_23/random_uniform/shapeConst*%
valueB"         ©  *
dtype0
I
conv2d_23/random_uniform/minConst*
valueB
 *aÉ½*
dtype0
I
conv2d_23/random_uniform/maxConst*
valueB
 *aÉ=*
dtype0

&conv2d_23/random_uniform/RandomUniformRandomUniformconv2d_23/random_uniform/shape*
seed±ÿå)*
T0*
dtype0*
seed2á¿ö
h
conv2d_23/random_uniform/subSubconv2d_23/random_uniform/maxconv2d_23/random_uniform/min*
T0
r
conv2d_23/random_uniform/mulMul&conv2d_23/random_uniform/RandomUniformconv2d_23/random_uniform/sub*
T0
d
conv2d_23/random_uniformAddconv2d_23/random_uniform/mulconv2d_23/random_uniform/min*
T0
n
conv2d_23/kernel
VariableV2*
shape:©*
shared_name *
dtype0*
	container 
¤
conv2d_23/kernel/AssignAssignconv2d_23/kernelconv2d_23/random_uniform*
use_locking(*
T0*#
_class
loc:@conv2d_23/kernel*
validate_shape(
a
conv2d_23/kernel/readIdentityconv2d_23/kernel*
T0*#
_class
loc:@conv2d_23/kernel
:
conv2d_23/SquareSquareconv2d_23/kernel/read*
T0
<
conv2d_23/mul/xConst*
valueB
 *o:*
dtype0
@
conv2d_23/mulMulconv2d_23/mul/xconv2d_23/Square*
T0
L
conv2d_23/ConstConst*%
valueB"             *
dtype0
Z
conv2d_23/SumSumconv2d_23/mulconv2d_23/Const*

Tidx0*
	keep_dims( *
T0
<
conv2d_23/add/xConst*
valueB
 *    *
dtype0
=
conv2d_23/addAddconv2d_23/add/xconv2d_23/Sum*
T0
C
conv2d_23/Const_1Const*
valueB©*    *
dtype0
_
conv2d_23/bias
VariableV2*
shape:©*
shared_name *
dtype0*
	container 

conv2d_23/bias/AssignAssignconv2d_23/biasconv2d_23/Const_1*
use_locking(*
T0*!
_class
loc:@conv2d_23/bias*
validate_shape(
[
conv2d_23/bias/readIdentityconv2d_23/bias*
T0*!
_class
loc:@conv2d_23/bias
X
#conv2d_23/convolution/dilation_rateConst*
valueB"      *
dtype0
Ø
conv2d_23/convolutionConv2Dleakyrelu_22/subconv2d_23/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
h
conv2d_23/BiasAddBiasAddconv2d_23/convolutionconv2d_23/bias/read*
T0*
data_formatNHWC
D
PlaceholderPlaceholder*
shape: *
dtype0

AssignAssignconv2d_1/kernelPlaceholder*
use_locking( *
T0*"
_class
loc:@conv2d_1/kernel*
validate_shape(
:
Placeholder_1Placeholder*
shape: *
dtype0
 
Assign_1Assignbatch_normalization_1/gammaPlaceholder_1*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_1/gamma*
validate_shape(
:
Placeholder_2Placeholder*
shape: *
dtype0

Assign_2Assignbatch_normalization_1/betaPlaceholder_2*
use_locking( *
T0*-
_class#
!loc:@batch_normalization_1/beta*
validate_shape(
:
Placeholder_3Placeholder*
shape: *
dtype0
¬
Assign_3Assign!batch_normalization_1/moving_meanPlaceholder_3*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean*
validate_shape(
:
Placeholder_4Placeholder*
shape: *
dtype0
´
Assign_4Assign%batch_normalization_1/moving_variancePlaceholder_4*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
validate_shape(
F
Placeholder_5Placeholder*
shape: @*
dtype0

Assign_5Assignconv2d_2/kernelPlaceholder_5*
use_locking( *
T0*"
_class
loc:@conv2d_2/kernel*
validate_shape(
:
Placeholder_6Placeholder*
shape:@*
dtype0
 
Assign_6Assignbatch_normalization_2/gammaPlaceholder_6*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_2/gamma*
validate_shape(
:
Placeholder_7Placeholder*
shape:@*
dtype0

Assign_7Assignbatch_normalization_2/betaPlaceholder_7*
use_locking( *
T0*-
_class#
!loc:@batch_normalization_2/beta*
validate_shape(
:
Placeholder_8Placeholder*
shape:@*
dtype0
¬
Assign_8Assign!batch_normalization_2/moving_meanPlaceholder_8*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean*
validate_shape(
:
Placeholder_9Placeholder*
shape:@*
dtype0
´
Assign_9Assign%batch_normalization_2/moving_variancePlaceholder_9*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance*
validate_shape(
H
Placeholder_10Placeholder*
shape:@*
dtype0

	Assign_10Assignconv2d_3/kernelPlaceholder_10*
use_locking( *
T0*"
_class
loc:@conv2d_3/kernel*
validate_shape(
<
Placeholder_11Placeholder*
shape:*
dtype0
¢
	Assign_11Assignbatch_normalization_3/gammaPlaceholder_11*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_3/gamma*
validate_shape(
<
Placeholder_12Placeholder*
shape:*
dtype0
 
	Assign_12Assignbatch_normalization_3/betaPlaceholder_12*
use_locking( *
T0*-
_class#
!loc:@batch_normalization_3/beta*
validate_shape(
<
Placeholder_13Placeholder*
shape:*
dtype0
®
	Assign_13Assign!batch_normalization_3/moving_meanPlaceholder_13*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean*
validate_shape(
<
Placeholder_14Placeholder*
shape:*
dtype0
¶
	Assign_14Assign%batch_normalization_3/moving_variancePlaceholder_14*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance*
validate_shape(
H
Placeholder_15Placeholder*
shape:@*
dtype0

	Assign_15Assignconv2d_4/kernelPlaceholder_15*
use_locking( *
T0*"
_class
loc:@conv2d_4/kernel*
validate_shape(
;
Placeholder_16Placeholder*
shape:@*
dtype0
¢
	Assign_16Assignbatch_normalization_4/gammaPlaceholder_16*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_4/gamma*
validate_shape(
;
Placeholder_17Placeholder*
shape:@*
dtype0
 
	Assign_17Assignbatch_normalization_4/betaPlaceholder_17*
use_locking( *
T0*-
_class#
!loc:@batch_normalization_4/beta*
validate_shape(
;
Placeholder_18Placeholder*
shape:@*
dtype0
®
	Assign_18Assign!batch_normalization_4/moving_meanPlaceholder_18*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_4/moving_mean*
validate_shape(
;
Placeholder_19Placeholder*
shape:@*
dtype0
¶
	Assign_19Assign%batch_normalization_4/moving_variancePlaceholder_19*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_4/moving_variance*
validate_shape(
H
Placeholder_20Placeholder*
shape:@*
dtype0

	Assign_20Assignconv2d_5/kernelPlaceholder_20*
use_locking( *
T0*"
_class
loc:@conv2d_5/kernel*
validate_shape(
<
Placeholder_21Placeholder*
shape:*
dtype0
¢
	Assign_21Assignbatch_normalization_5/gammaPlaceholder_21*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_5/gamma*
validate_shape(
<
Placeholder_22Placeholder*
shape:*
dtype0
 
	Assign_22Assignbatch_normalization_5/betaPlaceholder_22*
use_locking( *
T0*-
_class#
!loc:@batch_normalization_5/beta*
validate_shape(
<
Placeholder_23Placeholder*
shape:*
dtype0
®
	Assign_23Assign!batch_normalization_5/moving_meanPlaceholder_23*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_5/moving_mean*
validate_shape(
<
Placeholder_24Placeholder*
shape:*
dtype0
¶
	Assign_24Assign%batch_normalization_5/moving_variancePlaceholder_24*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_5/moving_variance*
validate_shape(
I
Placeholder_25Placeholder*
shape:*
dtype0

	Assign_25Assignconv2d_6/kernelPlaceholder_25*
use_locking( *
T0*"
_class
loc:@conv2d_6/kernel*
validate_shape(
<
Placeholder_26Placeholder*
shape:*
dtype0
¢
	Assign_26Assignbatch_normalization_6/gammaPlaceholder_26*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_6/gamma*
validate_shape(
<
Placeholder_27Placeholder*
shape:*
dtype0
 
	Assign_27Assignbatch_normalization_6/betaPlaceholder_27*
use_locking( *
T0*-
_class#
!loc:@batch_normalization_6/beta*
validate_shape(
<
Placeholder_28Placeholder*
shape:*
dtype0
®
	Assign_28Assign!batch_normalization_6/moving_meanPlaceholder_28*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_6/moving_mean*
validate_shape(
<
Placeholder_29Placeholder*
shape:*
dtype0
¶
	Assign_29Assign%batch_normalization_6/moving_variancePlaceholder_29*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_6/moving_variance*
validate_shape(
I
Placeholder_30Placeholder*
shape:*
dtype0

	Assign_30Assignconv2d_7/kernelPlaceholder_30*
use_locking( *
T0*"
_class
loc:@conv2d_7/kernel*
validate_shape(
<
Placeholder_31Placeholder*
shape:*
dtype0
¢
	Assign_31Assignbatch_normalization_7/gammaPlaceholder_31*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_7/gamma*
validate_shape(
<
Placeholder_32Placeholder*
shape:*
dtype0
 
	Assign_32Assignbatch_normalization_7/betaPlaceholder_32*
use_locking( *
T0*-
_class#
!loc:@batch_normalization_7/beta*
validate_shape(
<
Placeholder_33Placeholder*
shape:*
dtype0
®
	Assign_33Assign!batch_normalization_7/moving_meanPlaceholder_33*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_7/moving_mean*
validate_shape(
<
Placeholder_34Placeholder*
shape:*
dtype0
¶
	Assign_34Assign%batch_normalization_7/moving_variancePlaceholder_34*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_7/moving_variance*
validate_shape(
I
Placeholder_35Placeholder*
shape:*
dtype0

	Assign_35Assignconv2d_8/kernelPlaceholder_35*
use_locking( *
T0*"
_class
loc:@conv2d_8/kernel*
validate_shape(
<
Placeholder_36Placeholder*
shape:*
dtype0
¢
	Assign_36Assignbatch_normalization_8/gammaPlaceholder_36*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_8/gamma*
validate_shape(
<
Placeholder_37Placeholder*
shape:*
dtype0
 
	Assign_37Assignbatch_normalization_8/betaPlaceholder_37*
use_locking( *
T0*-
_class#
!loc:@batch_normalization_8/beta*
validate_shape(
<
Placeholder_38Placeholder*
shape:*
dtype0
®
	Assign_38Assign!batch_normalization_8/moving_meanPlaceholder_38*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_8/moving_mean*
validate_shape(
<
Placeholder_39Placeholder*
shape:*
dtype0
¶
	Assign_39Assign%batch_normalization_8/moving_variancePlaceholder_39*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_8/moving_variance*
validate_shape(
I
Placeholder_40Placeholder*
shape:*
dtype0

	Assign_40Assignconv2d_9/kernelPlaceholder_40*
use_locking( *
T0*"
_class
loc:@conv2d_9/kernel*
validate_shape(
<
Placeholder_41Placeholder*
shape:*
dtype0
¢
	Assign_41Assignbatch_normalization_9/gammaPlaceholder_41*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_9/gamma*
validate_shape(
<
Placeholder_42Placeholder*
shape:*
dtype0
 
	Assign_42Assignbatch_normalization_9/betaPlaceholder_42*
use_locking( *
T0*-
_class#
!loc:@batch_normalization_9/beta*
validate_shape(
<
Placeholder_43Placeholder*
shape:*
dtype0
®
	Assign_43Assign!batch_normalization_9/moving_meanPlaceholder_43*
use_locking( *
T0*4
_class*
(&loc:@batch_normalization_9/moving_mean*
validate_shape(
<
Placeholder_44Placeholder*
shape:*
dtype0
¶
	Assign_44Assign%batch_normalization_9/moving_variancePlaceholder_44*
use_locking( *
T0*8
_class.
,*loc:@batch_normalization_9/moving_variance*
validate_shape(
I
Placeholder_45Placeholder*
shape:*
dtype0

	Assign_45Assignconv2d_10/kernelPlaceholder_45*
use_locking( *
T0*#
_class
loc:@conv2d_10/kernel*
validate_shape(
<
Placeholder_46Placeholder*
shape:*
dtype0
¤
	Assign_46Assignbatch_normalization_10/gammaPlaceholder_46*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_10/gamma*
validate_shape(
<
Placeholder_47Placeholder*
shape:*
dtype0
¢
	Assign_47Assignbatch_normalization_10/betaPlaceholder_47*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_10/beta*
validate_shape(
<
Placeholder_48Placeholder*
shape:*
dtype0
°
	Assign_48Assign"batch_normalization_10/moving_meanPlaceholder_48*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_10/moving_mean*
validate_shape(
<
Placeholder_49Placeholder*
shape:*
dtype0
¸
	Assign_49Assign&batch_normalization_10/moving_variancePlaceholder_49*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_10/moving_variance*
validate_shape(
I
Placeholder_50Placeholder*
shape:*
dtype0

	Assign_50Assignconv2d_11/kernelPlaceholder_50*
use_locking( *
T0*#
_class
loc:@conv2d_11/kernel*
validate_shape(
<
Placeholder_51Placeholder*
shape:*
dtype0
¤
	Assign_51Assignbatch_normalization_11/gammaPlaceholder_51*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_11/gamma*
validate_shape(
<
Placeholder_52Placeholder*
shape:*
dtype0
¢
	Assign_52Assignbatch_normalization_11/betaPlaceholder_52*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_11/beta*
validate_shape(
<
Placeholder_53Placeholder*
shape:*
dtype0
°
	Assign_53Assign"batch_normalization_11/moving_meanPlaceholder_53*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_11/moving_mean*
validate_shape(
<
Placeholder_54Placeholder*
shape:*
dtype0
¸
	Assign_54Assign&batch_normalization_11/moving_variancePlaceholder_54*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_11/moving_variance*
validate_shape(
I
Placeholder_55Placeholder*
shape:*
dtype0

	Assign_55Assignconv2d_12/kernelPlaceholder_55*
use_locking( *
T0*#
_class
loc:@conv2d_12/kernel*
validate_shape(
<
Placeholder_56Placeholder*
shape:*
dtype0
¤
	Assign_56Assignbatch_normalization_12/gammaPlaceholder_56*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_12/gamma*
validate_shape(
<
Placeholder_57Placeholder*
shape:*
dtype0
¢
	Assign_57Assignbatch_normalization_12/betaPlaceholder_57*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_12/beta*
validate_shape(
<
Placeholder_58Placeholder*
shape:*
dtype0
°
	Assign_58Assign"batch_normalization_12/moving_meanPlaceholder_58*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_12/moving_mean*
validate_shape(
<
Placeholder_59Placeholder*
shape:*
dtype0
¸
	Assign_59Assign&batch_normalization_12/moving_variancePlaceholder_59*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_12/moving_variance*
validate_shape(
I
Placeholder_60Placeholder*
shape:*
dtype0

	Assign_60Assignconv2d_13/kernelPlaceholder_60*
use_locking( *
T0*#
_class
loc:@conv2d_13/kernel*
validate_shape(
<
Placeholder_61Placeholder*
shape:*
dtype0
¤
	Assign_61Assignbatch_normalization_13/gammaPlaceholder_61*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_13/gamma*
validate_shape(
<
Placeholder_62Placeholder*
shape:*
dtype0
¢
	Assign_62Assignbatch_normalization_13/betaPlaceholder_62*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_13/beta*
validate_shape(
<
Placeholder_63Placeholder*
shape:*
dtype0
°
	Assign_63Assign"batch_normalization_13/moving_meanPlaceholder_63*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_13/moving_mean*
validate_shape(
<
Placeholder_64Placeholder*
shape:*
dtype0
¸
	Assign_64Assign&batch_normalization_13/moving_variancePlaceholder_64*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_13/moving_variance*
validate_shape(
I
Placeholder_65Placeholder*
shape:*
dtype0

	Assign_65Assignconv2d_14/kernelPlaceholder_65*
use_locking( *
T0*#
_class
loc:@conv2d_14/kernel*
validate_shape(
<
Placeholder_66Placeholder*
shape:*
dtype0
¤
	Assign_66Assignbatch_normalization_14/gammaPlaceholder_66*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_14/gamma*
validate_shape(
<
Placeholder_67Placeholder*
shape:*
dtype0
¢
	Assign_67Assignbatch_normalization_14/betaPlaceholder_67*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_14/beta*
validate_shape(
<
Placeholder_68Placeholder*
shape:*
dtype0
°
	Assign_68Assign"batch_normalization_14/moving_meanPlaceholder_68*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_14/moving_mean*
validate_shape(
<
Placeholder_69Placeholder*
shape:*
dtype0
¸
	Assign_69Assign&batch_normalization_14/moving_variancePlaceholder_69*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_14/moving_variance*
validate_shape(
I
Placeholder_70Placeholder*
shape:*
dtype0

	Assign_70Assignconv2d_15/kernelPlaceholder_70*
use_locking( *
T0*#
_class
loc:@conv2d_15/kernel*
validate_shape(
<
Placeholder_71Placeholder*
shape:*
dtype0
¤
	Assign_71Assignbatch_normalization_15/gammaPlaceholder_71*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_15/gamma*
validate_shape(
<
Placeholder_72Placeholder*
shape:*
dtype0
¢
	Assign_72Assignbatch_normalization_15/betaPlaceholder_72*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_15/beta*
validate_shape(
<
Placeholder_73Placeholder*
shape:*
dtype0
°
	Assign_73Assign"batch_normalization_15/moving_meanPlaceholder_73*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_15/moving_mean*
validate_shape(
<
Placeholder_74Placeholder*
shape:*
dtype0
¸
	Assign_74Assign&batch_normalization_15/moving_variancePlaceholder_74*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_15/moving_variance*
validate_shape(
I
Placeholder_75Placeholder*
shape:*
dtype0

	Assign_75Assignconv2d_16/kernelPlaceholder_75*
use_locking( *
T0*#
_class
loc:@conv2d_16/kernel*
validate_shape(
<
Placeholder_76Placeholder*
shape:*
dtype0
¤
	Assign_76Assignbatch_normalization_16/gammaPlaceholder_76*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_16/gamma*
validate_shape(
<
Placeholder_77Placeholder*
shape:*
dtype0
¢
	Assign_77Assignbatch_normalization_16/betaPlaceholder_77*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_16/beta*
validate_shape(
<
Placeholder_78Placeholder*
shape:*
dtype0
°
	Assign_78Assign"batch_normalization_16/moving_meanPlaceholder_78*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_16/moving_mean*
validate_shape(
<
Placeholder_79Placeholder*
shape:*
dtype0
¸
	Assign_79Assign&batch_normalization_16/moving_variancePlaceholder_79*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_16/moving_variance*
validate_shape(
I
Placeholder_80Placeholder*
shape:*
dtype0

	Assign_80Assignconv2d_17/kernelPlaceholder_80*
use_locking( *
T0*#
_class
loc:@conv2d_17/kernel*
validate_shape(
<
Placeholder_81Placeholder*
shape:*
dtype0
¤
	Assign_81Assignbatch_normalization_17/gammaPlaceholder_81*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_17/gamma*
validate_shape(
<
Placeholder_82Placeholder*
shape:*
dtype0
¢
	Assign_82Assignbatch_normalization_17/betaPlaceholder_82*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_17/beta*
validate_shape(
<
Placeholder_83Placeholder*
shape:*
dtype0
°
	Assign_83Assign"batch_normalization_17/moving_meanPlaceholder_83*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_17/moving_mean*
validate_shape(
<
Placeholder_84Placeholder*
shape:*
dtype0
¸
	Assign_84Assign&batch_normalization_17/moving_variancePlaceholder_84*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_17/moving_variance*
validate_shape(
I
Placeholder_85Placeholder*
shape:*
dtype0

	Assign_85Assignconv2d_18/kernelPlaceholder_85*
use_locking( *
T0*#
_class
loc:@conv2d_18/kernel*
validate_shape(
<
Placeholder_86Placeholder*
shape:*
dtype0
¤
	Assign_86Assignbatch_normalization_18/gammaPlaceholder_86*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_18/gamma*
validate_shape(
<
Placeholder_87Placeholder*
shape:*
dtype0
¢
	Assign_87Assignbatch_normalization_18/betaPlaceholder_87*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_18/beta*
validate_shape(
<
Placeholder_88Placeholder*
shape:*
dtype0
°
	Assign_88Assign"batch_normalization_18/moving_meanPlaceholder_88*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_18/moving_mean*
validate_shape(
<
Placeholder_89Placeholder*
shape:*
dtype0
¸
	Assign_89Assign&batch_normalization_18/moving_variancePlaceholder_89*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_18/moving_variance*
validate_shape(
I
Placeholder_90Placeholder*
shape:*
dtype0

	Assign_90Assignconv2d_19/kernelPlaceholder_90*
use_locking( *
T0*#
_class
loc:@conv2d_19/kernel*
validate_shape(
<
Placeholder_91Placeholder*
shape:*
dtype0
¤
	Assign_91Assignbatch_normalization_19/gammaPlaceholder_91*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_19/gamma*
validate_shape(
<
Placeholder_92Placeholder*
shape:*
dtype0
¢
	Assign_92Assignbatch_normalization_19/betaPlaceholder_92*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_19/beta*
validate_shape(
<
Placeholder_93Placeholder*
shape:*
dtype0
°
	Assign_93Assign"batch_normalization_19/moving_meanPlaceholder_93*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_19/moving_mean*
validate_shape(
<
Placeholder_94Placeholder*
shape:*
dtype0
¸
	Assign_94Assign&batch_normalization_19/moving_variancePlaceholder_94*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_19/moving_variance*
validate_shape(
H
Placeholder_95Placeholder*
shape:@*
dtype0

	Assign_95Assignconv2d_21/kernelPlaceholder_95*
use_locking( *
T0*#
_class
loc:@conv2d_21/kernel*
validate_shape(
;
Placeholder_96Placeholder*
shape:@*
dtype0
¤
	Assign_96Assignbatch_normalization_21/gammaPlaceholder_96*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_21/gamma*
validate_shape(
;
Placeholder_97Placeholder*
shape:@*
dtype0
¢
	Assign_97Assignbatch_normalization_21/betaPlaceholder_97*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_21/beta*
validate_shape(
;
Placeholder_98Placeholder*
shape:@*
dtype0
°
	Assign_98Assign"batch_normalization_21/moving_meanPlaceholder_98*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_21/moving_mean*
validate_shape(
;
Placeholder_99Placeholder*
shape:@*
dtype0
¸
	Assign_99Assign&batch_normalization_21/moving_variancePlaceholder_99*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_21/moving_variance*
validate_shape(
J
Placeholder_100Placeholder*
shape:*
dtype0


Assign_100Assignconv2d_20/kernelPlaceholder_100*
use_locking( *
T0*#
_class
loc:@conv2d_20/kernel*
validate_shape(
=
Placeholder_101Placeholder*
shape:*
dtype0
¦

Assign_101Assignbatch_normalization_20/gammaPlaceholder_101*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_20/gamma*
validate_shape(
=
Placeholder_102Placeholder*
shape:*
dtype0
¤

Assign_102Assignbatch_normalization_20/betaPlaceholder_102*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_20/beta*
validate_shape(
=
Placeholder_103Placeholder*
shape:*
dtype0
²

Assign_103Assign"batch_normalization_20/moving_meanPlaceholder_103*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_20/moving_mean*
validate_shape(
=
Placeholder_104Placeholder*
shape:*
dtype0
º

Assign_104Assign&batch_normalization_20/moving_variancePlaceholder_104*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_20/moving_variance*
validate_shape(
J
Placeholder_105Placeholder*
shape:
*
dtype0


Assign_105Assignconv2d_22/kernelPlaceholder_105*
use_locking( *
T0*#
_class
loc:@conv2d_22/kernel*
validate_shape(
=
Placeholder_106Placeholder*
shape:*
dtype0
¦

Assign_106Assignbatch_normalization_22/gammaPlaceholder_106*
use_locking( *
T0*/
_class%
#!loc:@batch_normalization_22/gamma*
validate_shape(
=
Placeholder_107Placeholder*
shape:*
dtype0
¤

Assign_107Assignbatch_normalization_22/betaPlaceholder_107*
use_locking( *
T0*.
_class$
" loc:@batch_normalization_22/beta*
validate_shape(
=
Placeholder_108Placeholder*
shape:*
dtype0
²

Assign_108Assign"batch_normalization_22/moving_meanPlaceholder_108*
use_locking( *
T0*5
_class+
)'loc:@batch_normalization_22/moving_mean*
validate_shape(
=
Placeholder_109Placeholder*
shape:*
dtype0
º

Assign_109Assign&batch_normalization_22/moving_variancePlaceholder_109*
use_locking( *
T0*9
_class/
-+loc:@batch_normalization_22/moving_variance*
validate_shape(
J
Placeholder_110Placeholder*
shape:©*
dtype0


Assign_110Assignconv2d_23/kernelPlaceholder_110*
use_locking( *
T0*#
_class
loc:@conv2d_23/kernel*
validate_shape(
=
Placeholder_111Placeholder*
shape:©*
dtype0


Assign_111Assignconv2d_23/biasPlaceholder_111*
use_locking( *
T0*!
_class
loc:@conv2d_23/bias*
validate_shape(
p
IsVariableInitializedIsVariableInitializedconv2d_1/kernel*"
_class
loc:@conv2d_1/kernel*
dtype0

IsVariableInitialized_1IsVariableInitializedbatch_normalization_1/gamma*.
_class$
" loc:@batch_normalization_1/gamma*
dtype0

IsVariableInitialized_2IsVariableInitializedbatch_normalization_1/beta*-
_class#
!loc:@batch_normalization_1/beta*
dtype0

IsVariableInitialized_3IsVariableInitialized!batch_normalization_1/moving_mean*4
_class*
(&loc:@batch_normalization_1/moving_mean*
dtype0

IsVariableInitialized_4IsVariableInitialized%batch_normalization_1/moving_variance*8
_class.
,*loc:@batch_normalization_1/moving_variance*
dtype0
r
IsVariableInitialized_5IsVariableInitializedconv2d_2/kernel*"
_class
loc:@conv2d_2/kernel*
dtype0

IsVariableInitialized_6IsVariableInitializedbatch_normalization_2/gamma*.
_class$
" loc:@batch_normalization_2/gamma*
dtype0

IsVariableInitialized_7IsVariableInitializedbatch_normalization_2/beta*-
_class#
!loc:@batch_normalization_2/beta*
dtype0

IsVariableInitialized_8IsVariableInitialized!batch_normalization_2/moving_mean*4
_class*
(&loc:@batch_normalization_2/moving_mean*
dtype0

IsVariableInitialized_9IsVariableInitialized%batch_normalization_2/moving_variance*8
_class.
,*loc:@batch_normalization_2/moving_variance*
dtype0
s
IsVariableInitialized_10IsVariableInitializedconv2d_3/kernel*"
_class
loc:@conv2d_3/kernel*
dtype0

IsVariableInitialized_11IsVariableInitializedbatch_normalization_3/gamma*.
_class$
" loc:@batch_normalization_3/gamma*
dtype0

IsVariableInitialized_12IsVariableInitializedbatch_normalization_3/beta*-
_class#
!loc:@batch_normalization_3/beta*
dtype0

IsVariableInitialized_13IsVariableInitialized!batch_normalization_3/moving_mean*4
_class*
(&loc:@batch_normalization_3/moving_mean*
dtype0

IsVariableInitialized_14IsVariableInitialized%batch_normalization_3/moving_variance*8
_class.
,*loc:@batch_normalization_3/moving_variance*
dtype0
s
IsVariableInitialized_15IsVariableInitializedconv2d_4/kernel*"
_class
loc:@conv2d_4/kernel*
dtype0

IsVariableInitialized_16IsVariableInitializedbatch_normalization_4/gamma*.
_class$
" loc:@batch_normalization_4/gamma*
dtype0

IsVariableInitialized_17IsVariableInitializedbatch_normalization_4/beta*-
_class#
!loc:@batch_normalization_4/beta*
dtype0

IsVariableInitialized_18IsVariableInitialized!batch_normalization_4/moving_mean*4
_class*
(&loc:@batch_normalization_4/moving_mean*
dtype0

IsVariableInitialized_19IsVariableInitialized%batch_normalization_4/moving_variance*8
_class.
,*loc:@batch_normalization_4/moving_variance*
dtype0
s
IsVariableInitialized_20IsVariableInitializedconv2d_5/kernel*"
_class
loc:@conv2d_5/kernel*
dtype0

IsVariableInitialized_21IsVariableInitializedbatch_normalization_5/gamma*.
_class$
" loc:@batch_normalization_5/gamma*
dtype0

IsVariableInitialized_22IsVariableInitializedbatch_normalization_5/beta*-
_class#
!loc:@batch_normalization_5/beta*
dtype0

IsVariableInitialized_23IsVariableInitialized!batch_normalization_5/moving_mean*4
_class*
(&loc:@batch_normalization_5/moving_mean*
dtype0

IsVariableInitialized_24IsVariableInitialized%batch_normalization_5/moving_variance*8
_class.
,*loc:@batch_normalization_5/moving_variance*
dtype0
s
IsVariableInitialized_25IsVariableInitializedconv2d_6/kernel*"
_class
loc:@conv2d_6/kernel*
dtype0

IsVariableInitialized_26IsVariableInitializedbatch_normalization_6/gamma*.
_class$
" loc:@batch_normalization_6/gamma*
dtype0

IsVariableInitialized_27IsVariableInitializedbatch_normalization_6/beta*-
_class#
!loc:@batch_normalization_6/beta*
dtype0

IsVariableInitialized_28IsVariableInitialized!batch_normalization_6/moving_mean*4
_class*
(&loc:@batch_normalization_6/moving_mean*
dtype0

IsVariableInitialized_29IsVariableInitialized%batch_normalization_6/moving_variance*8
_class.
,*loc:@batch_normalization_6/moving_variance*
dtype0
s
IsVariableInitialized_30IsVariableInitializedconv2d_7/kernel*"
_class
loc:@conv2d_7/kernel*
dtype0

IsVariableInitialized_31IsVariableInitializedbatch_normalization_7/gamma*.
_class$
" loc:@batch_normalization_7/gamma*
dtype0

IsVariableInitialized_32IsVariableInitializedbatch_normalization_7/beta*-
_class#
!loc:@batch_normalization_7/beta*
dtype0

IsVariableInitialized_33IsVariableInitialized!batch_normalization_7/moving_mean*4
_class*
(&loc:@batch_normalization_7/moving_mean*
dtype0

IsVariableInitialized_34IsVariableInitialized%batch_normalization_7/moving_variance*8
_class.
,*loc:@batch_normalization_7/moving_variance*
dtype0
s
IsVariableInitialized_35IsVariableInitializedconv2d_8/kernel*"
_class
loc:@conv2d_8/kernel*
dtype0

IsVariableInitialized_36IsVariableInitializedbatch_normalization_8/gamma*.
_class$
" loc:@batch_normalization_8/gamma*
dtype0

IsVariableInitialized_37IsVariableInitializedbatch_normalization_8/beta*-
_class#
!loc:@batch_normalization_8/beta*
dtype0

IsVariableInitialized_38IsVariableInitialized!batch_normalization_8/moving_mean*4
_class*
(&loc:@batch_normalization_8/moving_mean*
dtype0

IsVariableInitialized_39IsVariableInitialized%batch_normalization_8/moving_variance*8
_class.
,*loc:@batch_normalization_8/moving_variance*
dtype0
s
IsVariableInitialized_40IsVariableInitializedconv2d_9/kernel*"
_class
loc:@conv2d_9/kernel*
dtype0

IsVariableInitialized_41IsVariableInitializedbatch_normalization_9/gamma*.
_class$
" loc:@batch_normalization_9/gamma*
dtype0

IsVariableInitialized_42IsVariableInitializedbatch_normalization_9/beta*-
_class#
!loc:@batch_normalization_9/beta*
dtype0

IsVariableInitialized_43IsVariableInitialized!batch_normalization_9/moving_mean*4
_class*
(&loc:@batch_normalization_9/moving_mean*
dtype0

IsVariableInitialized_44IsVariableInitialized%batch_normalization_9/moving_variance*8
_class.
,*loc:@batch_normalization_9/moving_variance*
dtype0
u
IsVariableInitialized_45IsVariableInitializedconv2d_10/kernel*#
_class
loc:@conv2d_10/kernel*
dtype0

IsVariableInitialized_46IsVariableInitializedbatch_normalization_10/gamma*/
_class%
#!loc:@batch_normalization_10/gamma*
dtype0

IsVariableInitialized_47IsVariableInitializedbatch_normalization_10/beta*.
_class$
" loc:@batch_normalization_10/beta*
dtype0

IsVariableInitialized_48IsVariableInitialized"batch_normalization_10/moving_mean*5
_class+
)'loc:@batch_normalization_10/moving_mean*
dtype0
¡
IsVariableInitialized_49IsVariableInitialized&batch_normalization_10/moving_variance*9
_class/
-+loc:@batch_normalization_10/moving_variance*
dtype0
u
IsVariableInitialized_50IsVariableInitializedconv2d_11/kernel*#
_class
loc:@conv2d_11/kernel*
dtype0

IsVariableInitialized_51IsVariableInitializedbatch_normalization_11/gamma*/
_class%
#!loc:@batch_normalization_11/gamma*
dtype0

IsVariableInitialized_52IsVariableInitializedbatch_normalization_11/beta*.
_class$
" loc:@batch_normalization_11/beta*
dtype0

IsVariableInitialized_53IsVariableInitialized"batch_normalization_11/moving_mean*5
_class+
)'loc:@batch_normalization_11/moving_mean*
dtype0
¡
IsVariableInitialized_54IsVariableInitialized&batch_normalization_11/moving_variance*9
_class/
-+loc:@batch_normalization_11/moving_variance*
dtype0
u
IsVariableInitialized_55IsVariableInitializedconv2d_12/kernel*#
_class
loc:@conv2d_12/kernel*
dtype0

IsVariableInitialized_56IsVariableInitializedbatch_normalization_12/gamma*/
_class%
#!loc:@batch_normalization_12/gamma*
dtype0

IsVariableInitialized_57IsVariableInitializedbatch_normalization_12/beta*.
_class$
" loc:@batch_normalization_12/beta*
dtype0

IsVariableInitialized_58IsVariableInitialized"batch_normalization_12/moving_mean*5
_class+
)'loc:@batch_normalization_12/moving_mean*
dtype0
¡
IsVariableInitialized_59IsVariableInitialized&batch_normalization_12/moving_variance*9
_class/
-+loc:@batch_normalization_12/moving_variance*
dtype0
u
IsVariableInitialized_60IsVariableInitializedconv2d_13/kernel*#
_class
loc:@conv2d_13/kernel*
dtype0

IsVariableInitialized_61IsVariableInitializedbatch_normalization_13/gamma*/
_class%
#!loc:@batch_normalization_13/gamma*
dtype0

IsVariableInitialized_62IsVariableInitializedbatch_normalization_13/beta*.
_class$
" loc:@batch_normalization_13/beta*
dtype0

IsVariableInitialized_63IsVariableInitialized"batch_normalization_13/moving_mean*5
_class+
)'loc:@batch_normalization_13/moving_mean*
dtype0
¡
IsVariableInitialized_64IsVariableInitialized&batch_normalization_13/moving_variance*9
_class/
-+loc:@batch_normalization_13/moving_variance*
dtype0
u
IsVariableInitialized_65IsVariableInitializedconv2d_14/kernel*#
_class
loc:@conv2d_14/kernel*
dtype0

IsVariableInitialized_66IsVariableInitializedbatch_normalization_14/gamma*/
_class%
#!loc:@batch_normalization_14/gamma*
dtype0

IsVariableInitialized_67IsVariableInitializedbatch_normalization_14/beta*.
_class$
" loc:@batch_normalization_14/beta*
dtype0

IsVariableInitialized_68IsVariableInitialized"batch_normalization_14/moving_mean*5
_class+
)'loc:@batch_normalization_14/moving_mean*
dtype0
¡
IsVariableInitialized_69IsVariableInitialized&batch_normalization_14/moving_variance*9
_class/
-+loc:@batch_normalization_14/moving_variance*
dtype0
u
IsVariableInitialized_70IsVariableInitializedconv2d_15/kernel*#
_class
loc:@conv2d_15/kernel*
dtype0

IsVariableInitialized_71IsVariableInitializedbatch_normalization_15/gamma*/
_class%
#!loc:@batch_normalization_15/gamma*
dtype0

IsVariableInitialized_72IsVariableInitializedbatch_normalization_15/beta*.
_class$
" loc:@batch_normalization_15/beta*
dtype0

IsVariableInitialized_73IsVariableInitialized"batch_normalization_15/moving_mean*5
_class+
)'loc:@batch_normalization_15/moving_mean*
dtype0
¡
IsVariableInitialized_74IsVariableInitialized&batch_normalization_15/moving_variance*9
_class/
-+loc:@batch_normalization_15/moving_variance*
dtype0
u
IsVariableInitialized_75IsVariableInitializedconv2d_16/kernel*#
_class
loc:@conv2d_16/kernel*
dtype0

IsVariableInitialized_76IsVariableInitializedbatch_normalization_16/gamma*/
_class%
#!loc:@batch_normalization_16/gamma*
dtype0

IsVariableInitialized_77IsVariableInitializedbatch_normalization_16/beta*.
_class$
" loc:@batch_normalization_16/beta*
dtype0

IsVariableInitialized_78IsVariableInitialized"batch_normalization_16/moving_mean*5
_class+
)'loc:@batch_normalization_16/moving_mean*
dtype0
¡
IsVariableInitialized_79IsVariableInitialized&batch_normalization_16/moving_variance*9
_class/
-+loc:@batch_normalization_16/moving_variance*
dtype0
u
IsVariableInitialized_80IsVariableInitializedconv2d_17/kernel*#
_class
loc:@conv2d_17/kernel*
dtype0

IsVariableInitialized_81IsVariableInitializedbatch_normalization_17/gamma*/
_class%
#!loc:@batch_normalization_17/gamma*
dtype0

IsVariableInitialized_82IsVariableInitializedbatch_normalization_17/beta*.
_class$
" loc:@batch_normalization_17/beta*
dtype0

IsVariableInitialized_83IsVariableInitialized"batch_normalization_17/moving_mean*5
_class+
)'loc:@batch_normalization_17/moving_mean*
dtype0
¡
IsVariableInitialized_84IsVariableInitialized&batch_normalization_17/moving_variance*9
_class/
-+loc:@batch_normalization_17/moving_variance*
dtype0
u
IsVariableInitialized_85IsVariableInitializedconv2d_18/kernel*#
_class
loc:@conv2d_18/kernel*
dtype0

IsVariableInitialized_86IsVariableInitializedbatch_normalization_18/gamma*/
_class%
#!loc:@batch_normalization_18/gamma*
dtype0

IsVariableInitialized_87IsVariableInitializedbatch_normalization_18/beta*.
_class$
" loc:@batch_normalization_18/beta*
dtype0

IsVariableInitialized_88IsVariableInitialized"batch_normalization_18/moving_mean*5
_class+
)'loc:@batch_normalization_18/moving_mean*
dtype0
¡
IsVariableInitialized_89IsVariableInitialized&batch_normalization_18/moving_variance*9
_class/
-+loc:@batch_normalization_18/moving_variance*
dtype0
u
IsVariableInitialized_90IsVariableInitializedconv2d_19/kernel*#
_class
loc:@conv2d_19/kernel*
dtype0

IsVariableInitialized_91IsVariableInitializedbatch_normalization_19/gamma*/
_class%
#!loc:@batch_normalization_19/gamma*
dtype0

IsVariableInitialized_92IsVariableInitializedbatch_normalization_19/beta*.
_class$
" loc:@batch_normalization_19/beta*
dtype0

IsVariableInitialized_93IsVariableInitialized"batch_normalization_19/moving_mean*5
_class+
)'loc:@batch_normalization_19/moving_mean*
dtype0
¡
IsVariableInitialized_94IsVariableInitialized&batch_normalization_19/moving_variance*9
_class/
-+loc:@batch_normalization_19/moving_variance*
dtype0
u
IsVariableInitialized_95IsVariableInitializedconv2d_21/kernel*#
_class
loc:@conv2d_21/kernel*
dtype0

IsVariableInitialized_96IsVariableInitializedbatch_normalization_21/gamma*/
_class%
#!loc:@batch_normalization_21/gamma*
dtype0

IsVariableInitialized_97IsVariableInitializedbatch_normalization_21/beta*.
_class$
" loc:@batch_normalization_21/beta*
dtype0

IsVariableInitialized_98IsVariableInitialized"batch_normalization_21/moving_mean*5
_class+
)'loc:@batch_normalization_21/moving_mean*
dtype0
¡
IsVariableInitialized_99IsVariableInitialized&batch_normalization_21/moving_variance*9
_class/
-+loc:@batch_normalization_21/moving_variance*
dtype0
v
IsVariableInitialized_100IsVariableInitializedconv2d_20/kernel*#
_class
loc:@conv2d_20/kernel*
dtype0

IsVariableInitialized_101IsVariableInitializedbatch_normalization_20/gamma*/
_class%
#!loc:@batch_normalization_20/gamma*
dtype0

IsVariableInitialized_102IsVariableInitializedbatch_normalization_20/beta*.
_class$
" loc:@batch_normalization_20/beta*
dtype0

IsVariableInitialized_103IsVariableInitialized"batch_normalization_20/moving_mean*5
_class+
)'loc:@batch_normalization_20/moving_mean*
dtype0
¢
IsVariableInitialized_104IsVariableInitialized&batch_normalization_20/moving_variance*9
_class/
-+loc:@batch_normalization_20/moving_variance*
dtype0
v
IsVariableInitialized_105IsVariableInitializedconv2d_22/kernel*#
_class
loc:@conv2d_22/kernel*
dtype0

IsVariableInitialized_106IsVariableInitializedbatch_normalization_22/gamma*/
_class%
#!loc:@batch_normalization_22/gamma*
dtype0

IsVariableInitialized_107IsVariableInitializedbatch_normalization_22/beta*.
_class$
" loc:@batch_normalization_22/beta*
dtype0

IsVariableInitialized_108IsVariableInitialized"batch_normalization_22/moving_mean*5
_class+
)'loc:@batch_normalization_22/moving_mean*
dtype0
¢
IsVariableInitialized_109IsVariableInitialized&batch_normalization_22/moving_variance*9
_class/
-+loc:@batch_normalization_22/moving_variance*
dtype0
v
IsVariableInitialized_110IsVariableInitializedconv2d_23/kernel*#
_class
loc:@conv2d_23/kernel*
dtype0
r
IsVariableInitialized_111IsVariableInitializedconv2d_23/bias*!
_class
loc:@conv2d_23/bias*
dtype0
§!
initNoOp"^batch_normalization_1/beta/Assign#^batch_normalization_1/gamma/Assign)^batch_normalization_1/moving_mean/Assign-^batch_normalization_1/moving_variance/Assign#^batch_normalization_10/beta/Assign$^batch_normalization_10/gamma/Assign*^batch_normalization_10/moving_mean/Assign.^batch_normalization_10/moving_variance/Assign#^batch_normalization_11/beta/Assign$^batch_normalization_11/gamma/Assign*^batch_normalization_11/moving_mean/Assign.^batch_normalization_11/moving_variance/Assign#^batch_normalization_12/beta/Assign$^batch_normalization_12/gamma/Assign*^batch_normalization_12/moving_mean/Assign.^batch_normalization_12/moving_variance/Assign#^batch_normalization_13/beta/Assign$^batch_normalization_13/gamma/Assign*^batch_normalization_13/moving_mean/Assign.^batch_normalization_13/moving_variance/Assign#^batch_normalization_14/beta/Assign$^batch_normalization_14/gamma/Assign*^batch_normalization_14/moving_mean/Assign.^batch_normalization_14/moving_variance/Assign#^batch_normalization_15/beta/Assign$^batch_normalization_15/gamma/Assign*^batch_normalization_15/moving_mean/Assign.^batch_normalization_15/moving_variance/Assign#^batch_normalization_16/beta/Assign$^batch_normalization_16/gamma/Assign*^batch_normalization_16/moving_mean/Assign.^batch_normalization_16/moving_variance/Assign#^batch_normalization_17/beta/Assign$^batch_normalization_17/gamma/Assign*^batch_normalization_17/moving_mean/Assign.^batch_normalization_17/moving_variance/Assign#^batch_normalization_18/beta/Assign$^batch_normalization_18/gamma/Assign*^batch_normalization_18/moving_mean/Assign.^batch_normalization_18/moving_variance/Assign#^batch_normalization_19/beta/Assign$^batch_normalization_19/gamma/Assign*^batch_normalization_19/moving_mean/Assign.^batch_normalization_19/moving_variance/Assign"^batch_normalization_2/beta/Assign#^batch_normalization_2/gamma/Assign)^batch_normalization_2/moving_mean/Assign-^batch_normalization_2/moving_variance/Assign#^batch_normalization_20/beta/Assign$^batch_normalization_20/gamma/Assign*^batch_normalization_20/moving_mean/Assign.^batch_normalization_20/moving_variance/Assign#^batch_normalization_21/beta/Assign$^batch_normalization_21/gamma/Assign*^batch_normalization_21/moving_mean/Assign.^batch_normalization_21/moving_variance/Assign#^batch_normalization_22/beta/Assign$^batch_normalization_22/gamma/Assign*^batch_normalization_22/moving_mean/Assign.^batch_normalization_22/moving_variance/Assign"^batch_normalization_3/beta/Assign#^batch_normalization_3/gamma/Assign)^batch_normalization_3/moving_mean/Assign-^batch_normalization_3/moving_variance/Assign"^batch_normalization_4/beta/Assign#^batch_normalization_4/gamma/Assign)^batch_normalization_4/moving_mean/Assign-^batch_normalization_4/moving_variance/Assign"^batch_normalization_5/beta/Assign#^batch_normalization_5/gamma/Assign)^batch_normalization_5/moving_mean/Assign-^batch_normalization_5/moving_variance/Assign"^batch_normalization_6/beta/Assign#^batch_normalization_6/gamma/Assign)^batch_normalization_6/moving_mean/Assign-^batch_normalization_6/moving_variance/Assign"^batch_normalization_7/beta/Assign#^batch_normalization_7/gamma/Assign)^batch_normalization_7/moving_mean/Assign-^batch_normalization_7/moving_variance/Assign"^batch_normalization_8/beta/Assign#^batch_normalization_8/gamma/Assign)^batch_normalization_8/moving_mean/Assign-^batch_normalization_8/moving_variance/Assign"^batch_normalization_9/beta/Assign#^batch_normalization_9/gamma/Assign)^batch_normalization_9/moving_mean/Assign-^batch_normalization_9/moving_variance/Assign^conv2d_1/kernel/Assign^conv2d_10/kernel/Assign^conv2d_11/kernel/Assign^conv2d_12/kernel/Assign^conv2d_13/kernel/Assign^conv2d_14/kernel/Assign^conv2d_15/kernel/Assign^conv2d_16/kernel/Assign^conv2d_17/kernel/Assign^conv2d_18/kernel/Assign^conv2d_19/kernel/Assign^conv2d_2/kernel/Assign^conv2d_20/kernel/Assign^conv2d_21/kernel/Assign^conv2d_22/kernel/Assign^conv2d_23/bias/Assign^conv2d_23/kernel/Assign^conv2d_3/kernel/Assign^conv2d_4/kernel/Assign^conv2d_5/kernel/Assign^conv2d_6/kernel/Assign^conv2d_7/kernel/Assign^conv2d_8/kernel/Assign^conv2d_9/kernel/Assign

Shape/ConstConst*i
value`B^"P=êÉü£ç?4øÀÿë?ªÔìV`@O0A@úD$=@çoB!.@Ë¡E¶ó}$@ãª²ï`@Éå?¤_)@Þ	¿'@*
dtype0
:
ShapeConst*
valueB"      *
dtype0
A
strided_slice/stackConst*
valueB: *
dtype0
C
strided_slice/stack_1Const*
valueB:*
dtype0
C
strided_slice/stack_2Const*
valueB:*
dtype0
á
strided_sliceStridedSliceShapestrided_slice/stackstrided_slice/stack_1strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
<
Shape_1Shapeconv2d_23/BiasAdd*
T0*
out_type0
o
Variable/initial_valueConst*A
value8B6"(æ=?vü_?´@ò*@%é@pá@ï#AW@"ýJAPü=A*
dtype0
\
Variable
VariableV2*
shape
:*
shared_name *
dtype0*
	container 

Variable/AssignAssignVariableVariable/initial_value*
use_locking(*
T0*
_class
loc:@Variable*
validate_shape(
I
Variable/readIdentityVariable*
T0*
_class
loc:@Variable
9
Reshape/shape/0Const*
value	B :*
dtype0
9
Reshape/shape/1Const*
value	B :*
dtype0
9
Reshape/shape/2Const*
value	B :*
dtype0
9
Reshape/shape/4Const*
value	B :*
dtype0

Reshape/shapePackReshape/shape/0Reshape/shape/1Reshape/shape/2strided_sliceReshape/shape/4*
T0*

axis *
N
G
ReshapeReshapeVariable/readReshape/shape*
T0*
Tshape0
C
strided_slice_1/stackConst*
valueB:*
dtype0
E
strided_slice_1/stack_1Const*
valueB:*
dtype0
E
strided_slice_1/stack_2Const*
valueB:*
dtype0
ë
strided_slice_1StridedSliceShape_1strided_slice_1/stackstrided_slice_1/stack_1strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
6
arange/startConst*
value	B : *
dtype0
6
arange/deltaConst*
value	B :*
dtype0
H
arangeRangearange/startstrided_slice_1arange/delta*

Tidx0
C
strided_slice_2/stackConst*
valueB:*
dtype0
E
strided_slice_2/stack_1Const*
valueB:*
dtype0
E
strided_slice_2/stack_2Const*
valueB:*
dtype0
ë
strided_slice_2StridedSliceShape_1strided_slice_2/stackstrided_slice_2/stack_1strided_slice_2/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
8
arange_1/startConst*
value	B : *
dtype0
8
arange_1/deltaConst*
value	B :*
dtype0
N
arange_1Rangearange_1/startstrided_slice_2arange_1/delta*

Tidx0
K
meshgrid/Reshape/shapeConst*
valueB"ÿÿÿÿ   *
dtype0
R
meshgrid/ReshapeReshapearangemeshgrid/Reshape/shape*
T0*
Tshape0
M
meshgrid/Reshape_1/shapeConst*
valueB"   ÿÿÿÿ*
dtype0
X
meshgrid/Reshape_1Reshapearange_1meshgrid/Reshape_1/shape*
T0*
Tshape0
6
meshgrid/SizeSizearange*
T0*
out_type0
:
meshgrid/Size_1Sizearange_1*
T0*
out_type0
M
meshgrid/Reshape_2/shapeConst*
valueB"   ÿÿÿÿ*
dtype0
`
meshgrid/Reshape_2Reshapemeshgrid/Reshapemeshgrid/Reshape_2/shape*
T0*
Tshape0
M
meshgrid/Reshape_3/shapeConst*
valueB"ÿÿÿÿ   *
dtype0
b
meshgrid/Reshape_3Reshapemeshgrid/Reshape_1meshgrid/Reshape_3/shape*
T0*
Tshape0
Y
meshgrid/ones/shapePackmeshgrid/Size_1meshgrid/Size*
T0*

axis *
N
=
meshgrid/ones/ConstConst*
value	B :*
dtype0
Z
meshgrid/onesFillmeshgrid/ones/shapemeshgrid/ones/Const*
T0*

index_type0
?
meshgrid/mulMulmeshgrid/Reshape_2meshgrid/ones*
T0
A
meshgrid/mul_1Mulmeshgrid/Reshape_3meshgrid/ones*
T0
5
concat/axisConst*
value	B : *
dtype0
[
concatConcatV2meshgrid/mulmeshgrid/mul_1concat/axis*

Tidx0*
T0*
N
C
strided_slice_3/stackConst*
valueB:*
dtype0
E
strided_slice_3/stack_1Const*
valueB:*
dtype0
E
strided_slice_3/stack_2Const*
valueB:*
dtype0
ë
strided_slice_3StridedSliceShape_1strided_slice_3/stackstrided_slice_3/stack_1strided_slice_3/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
C
strided_slice_4/stackConst*
valueB:*
dtype0
E
strided_slice_4/stack_1Const*
valueB:*
dtype0
E
strided_slice_4/stack_2Const*
valueB:*
dtype0
ë
strided_slice_4StridedSliceShape_1strided_slice_4/stackstrided_slice_4/stack_1strided_slice_4/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
;
Reshape_1/shape/0Const*
value	B :*
dtype0
j
Reshape_1/shapePackReshape_1/shape/0strided_slice_3strided_slice_4*
T0*

axis *
N
D
	Reshape_1ReshapeconcatReshape_1/shape*
T0*
Tshape0
G
transpose/permConst*!
valueB"          *
dtype0
G
	transpose	Transpose	Reshape_1transpose/perm*
Tperm0*
T0
8
ExpandDims/dimConst*
value	B : *
dtype0
H

ExpandDims
ExpandDims	transposeExpandDims/dim*

Tdim0*
T0
C
ExpandDims_1/dimConst*
valueB :
þÿÿÿÿÿÿÿÿ*
dtype0
M
ExpandDims_1
ExpandDims
ExpandDimsExpandDims_1/dim*

Tdim0*
T0
B
CastCastExpandDims_1*

SrcT0*
Truncate( *

DstT0
C
strided_slice_5/stackConst*
valueB:*
dtype0
E
strided_slice_5/stack_1Const*
valueB:*
dtype0
E
strided_slice_5/stack_2Const*
valueB:*
dtype0
ë
strided_slice_5StridedSliceShape_1strided_slice_5/stackstrided_slice_5/stack_1strided_slice_5/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
C
strided_slice_6/stackConst*
valueB:*
dtype0
E
strided_slice_6/stack_1Const*
valueB:*
dtype0
E
strided_slice_6/stack_2Const*
valueB:*
dtype0
ë
strided_slice_6StridedSliceShape_1strided_slice_6/stackstrided_slice_6/stack_1strided_slice_6/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
D
Reshape_2/shape/0Const*
valueB :
ÿÿÿÿÿÿÿÿÿ*
dtype0
;
Reshape_2/shape/4Const*
value	B :U*
dtype0

Reshape_2/shapePackReshape_2/shape/0strided_slice_5strided_slice_6strided_sliceReshape_2/shape/4*
T0*

axis *
N
O
	Reshape_2Reshapeconv2d_23/BiasAddReshape_2/shape*
T0*
Tshape0
J
strided_slice_7/stackConst*
valueB"        *
dtype0
L
strided_slice_7/stack_1Const*
valueB"       *
dtype0
L
strided_slice_7/stack_2Const*
valueB"      *
dtype0
í
strided_slice_7StridedSlice	Reshape_2strided_slice_7/stackstrided_slice_7/stack_1strided_slice_7/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask*
new_axis_mask *
end_mask 
,
SigmoidSigmoidstrided_slice_7*
T0
J
strided_slice_8/stackConst*
valueB"       *
dtype0
L
strided_slice_8/stack_1Const*
valueB"       *
dtype0
L
strided_slice_8/stack_2Const*
valueB"      *
dtype0
í
strided_slice_8StridedSlice	Reshape_2strided_slice_8/stackstrided_slice_8/stack_1strided_slice_8/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask*
new_axis_mask *
end_mask 
$
ExpExpstrided_slice_8*
T0
J
strided_slice_9/stackConst*
valueB"       *
dtype0
L
strided_slice_9/stack_1Const*
valueB"       *
dtype0
L
strided_slice_9/stack_2Const*
valueB"      *
dtype0
í
strided_slice_9StridedSlice	Reshape_2strided_slice_9/stackstrided_slice_9/stack_1strided_slice_9/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask*
new_axis_mask *
end_mask 
.
	Sigmoid_1Sigmoidstrided_slice_9*
T0
K
strided_slice_10/stackConst*
valueB"       *
dtype0
M
strided_slice_10/stack_1Const*
valueB"        *
dtype0
M
strided_slice_10/stack_2Const*
valueB"      *
dtype0
ñ
strided_slice_10StridedSlice	Reshape_2strided_slice_10/stackstrided_slice_10/stack_1strided_slice_10/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask*
new_axis_mask *
end_mask
;
Shape_2Shapestrided_slice_10*
T0*
out_type0
.
RankConst*
value	B :*
dtype0
;
Shape_3Shapestrided_slice_10*
T0*
out_type0
/
Sub/yConst*
value	B :*
dtype0
 
SubSubRankSub/y*
T0
6
Slice/beginPackSub*
T0*

axis *
N
8

Slice/sizeConst*
valueB:*
dtype0
F
SliceSliceShape_3Slice/begin
Slice/size*
Index0*
T0
H
concat_1/values_0Const*
valueB:
ÿÿÿÿÿÿÿÿÿ*
dtype0
7
concat_1/axisConst*
value	B : *
dtype0
[
concat_1ConcatV2concat_1/values_0Sliceconcat_1/axis*

Tidx0*
T0*
N
G
	Reshape_3Reshapestrided_slice_10concat_1*
T0*
Tshape0
&
SoftmaxSoftmax	Reshape_3*
T0
=
	Reshape_4ReshapeSoftmaxShape_2*
T0*
Tshape0
D
strided_slice_11/stackConst*
valueB:*
dtype0
F
strided_slice_11/stack_1Const*
valueB:*
dtype0
F
strided_slice_11/stack_2Const*
valueB:*
dtype0
ï
strided_slice_11StridedSliceShape_1strided_slice_11/stackstrided_slice_11/stack_1strided_slice_11/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
P
Reshape_5/shapeConst*)
value B"               *
dtype0
N
	Reshape_5Reshapestrided_slice_11Reshape_5/shape*
T0*
Tshape0
A
Cast_1Cast	Reshape_5*

SrcT0*
Truncate( *

DstT0
"
addAddSigmoidCast*
T0
(
truedivRealDivaddCast_1*
T0
!
mulMulExpReshape*
T0
*
	truediv_1RealDivmulCast_1*
T0
<
Placeholder_112Placeholder*
shape:*
dtype0
K
strided_slice_12/stackConst*
valueB"        *
dtype0
M
strided_slice_12/stack_1Const*
valueB"       *
dtype0
M
strided_slice_12/stack_2Const*
valueB"      *
dtype0
ï
strided_slice_12StridedSlicetruedivstrided_slice_12/stackstrided_slice_12/stack_1strided_slice_12/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask*
new_axis_mask *
end_mask 
K
strided_slice_13/stackConst*
valueB"        *
dtype0
M
strided_slice_13/stack_1Const*
valueB"       *
dtype0
M
strided_slice_13/stack_2Const*
valueB"      *
dtype0
ñ
strided_slice_13StridedSlice	truediv_1strided_slice_13/stackstrided_slice_13/stack_1strided_slice_13/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask*
new_axis_mask *
end_mask 
8
truediv_2/yConst*
valueB
 *   @*
dtype0
<
	truediv_2RealDivstrided_slice_13truediv_2/y*
T0
0
subSubstrided_slice_12	truediv_2*
T0
K
strided_slice_14/stackConst*
valueB"        *
dtype0
M
strided_slice_14/stack_1Const*
valueB"       *
dtype0
M
strided_slice_14/stack_2Const*
valueB"      *
dtype0
ï
strided_slice_14StridedSlicetruedivstrided_slice_14/stackstrided_slice_14/stack_1strided_slice_14/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask*
new_axis_mask *
end_mask 
K
strided_slice_15/stackConst*
valueB"        *
dtype0
M
strided_slice_15/stack_1Const*
valueB"       *
dtype0
M
strided_slice_15/stack_2Const*
valueB"      *
dtype0
ñ
strided_slice_15StridedSlice	truediv_1strided_slice_15/stackstrided_slice_15/stack_1strided_slice_15/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask*
new_axis_mask *
end_mask 
8
truediv_3/yConst*
valueB
 *   @*
dtype0
<
	truediv_3RealDivstrided_slice_15truediv_3/y*
T0
2
add_1Addstrided_slice_14	truediv_3*
T0
K
strided_slice_16/stackConst*
valueB"       *
dtype0
M
strided_slice_16/stack_1Const*
valueB"        *
dtype0
M
strided_slice_16/stack_2Const*
valueB"      *
dtype0
ï
strided_slice_16StridedSlicetruedivstrided_slice_16/stackstrided_slice_16/stack_1strided_slice_16/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask*
new_axis_mask *
end_mask
K
strided_slice_17/stackConst*
valueB"       *
dtype0
M
strided_slice_17/stack_1Const*
valueB"        *
dtype0
M
strided_slice_17/stack_2Const*
valueB"      *
dtype0
ñ
strided_slice_17StridedSlice	truediv_1strided_slice_17/stackstrided_slice_17/stack_1strided_slice_17/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask*
new_axis_mask *
end_mask
8
truediv_4/yConst*
valueB
 *   @*
dtype0
<
	truediv_4RealDivstrided_slice_17truediv_4/y*
T0
2
sub_1Substrided_slice_16	truediv_4*
T0
K
strided_slice_18/stackConst*
valueB"       *
dtype0
M
strided_slice_18/stack_1Const*
valueB"        *
dtype0
M
strided_slice_18/stack_2Const*
valueB"      *
dtype0
ï
strided_slice_18StridedSlicetruedivstrided_slice_18/stackstrided_slice_18/stack_1strided_slice_18/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask*
new_axis_mask *
end_mask
K
strided_slice_19/stackConst*
valueB"       *
dtype0
M
strided_slice_19/stack_1Const*
valueB"        *
dtype0
M
strided_slice_19/stack_2Const*
valueB"      *
dtype0
ñ
strided_slice_19StridedSlice	truediv_1strided_slice_19/stackstrided_slice_19/stack_1strided_slice_19/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask*
new_axis_mask *
end_mask
8
truediv_5/yConst*
valueB
 *   @*
dtype0
<
	truediv_5RealDivstrided_slice_19truediv_5/y*
T0
2
add_2Addstrided_slice_18	truediv_5*
T0
7
concat_2/axisConst*
value	B :*
dtype0
[
concat_2ConcatV2sub_1subadd_2add_1concat_2/axis*

Tidx0*
T0*
N
+
mul_1Mul	Sigmoid_1	Reshape_4*
T0
C
ArgMax/dimensionConst*
valueB :
ÿÿÿÿÿÿÿÿÿ*
dtype0
Q
ArgMaxArgMaxmul_1ArgMax/dimension*

Tidx0*
T0*
output_type0	
H
Max/reduction_indicesConst*
valueB :
ÿÿÿÿÿÿÿÿÿ*
dtype0
N
MaxMaxmul_1Max/reduction_indices*

Tidx0*
	keep_dims( *
T0
;
GreaterEqual/yConst*
valueB
 *ÍÌÌ>*
dtype0
:
GreaterEqualGreaterEqualMaxGreaterEqual/y*
T0
>
boolean_mask/ShapeShapeconcat_2*
T0*
out_type0
N
 boolean_mask/strided_slice/stackConst*
valueB: *
dtype0
P
"boolean_mask/strided_slice/stack_1Const*
valueB:*
dtype0
P
"boolean_mask/strided_slice/stack_2Const*
valueB:*
dtype0
¢
boolean_mask/strided_sliceStridedSliceboolean_mask/Shape boolean_mask/strided_slice/stack"boolean_mask/strided_slice/stack_1"boolean_mask/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask 
Q
#boolean_mask/Prod/reduction_indicesConst*
valueB: *
dtype0

boolean_mask/ProdProdboolean_mask/strided_slice#boolean_mask/Prod/reduction_indices*

Tidx0*
	keep_dims( *
T0
@
boolean_mask/Shape_1Shapeconcat_2*
T0*
out_type0
P
"boolean_mask/strided_slice_1/stackConst*
valueB:*
dtype0
R
$boolean_mask/strided_slice_1/stack_1Const*
valueB: *
dtype0
R
$boolean_mask/strided_slice_1/stack_2Const*
valueB:*
dtype0
¬
boolean_mask/strided_slice_1StridedSliceboolean_mask/Shape_1"boolean_mask/strided_slice_1/stack$boolean_mask/strided_slice_1/stack_1$boolean_mask/strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask
U
boolean_mask/concat/values_0Packboolean_mask/Prod*
T0*

axis *
N
B
boolean_mask/concat/axisConst*
value	B : *
dtype0

boolean_mask/concatConcatV2boolean_mask/concat/values_0boolean_mask/strided_slice_1boolean_mask/concat/axis*

Tidx0*
T0*
N
U
boolean_mask/ReshapeReshapeconcat_2boolean_mask/concat*
T0*
Tshape0
S
boolean_mask/Reshape_1/shapeConst*
valueB:
ÿÿÿÿÿÿÿÿÿ*
dtype0
d
boolean_mask/Reshape_1ReshapeGreaterEqualboolean_mask/Reshape_1/shape*
T0
*
Tshape0
<
boolean_mask/WhereWhereboolean_mask/Reshape_1*
T0

S
boolean_mask/SqueezeSqueezeboolean_mask/Where*
squeeze_dims
*
T0	

boolean_mask/GatherGatherboolean_mask/Reshapeboolean_mask/Squeeze*
Tindices0	*
Tparams0*
validate_indices(
;
boolean_mask_1/ShapeShapeMax*
T0*
out_type0
P
"boolean_mask_1/strided_slice/stackConst*
valueB: *
dtype0
R
$boolean_mask_1/strided_slice/stack_1Const*
valueB:*
dtype0
R
$boolean_mask_1/strided_slice/stack_2Const*
valueB:*
dtype0
¬
boolean_mask_1/strided_sliceStridedSliceboolean_mask_1/Shape"boolean_mask_1/strided_slice/stack$boolean_mask_1/strided_slice/stack_1$boolean_mask_1/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask 
S
%boolean_mask_1/Prod/reduction_indicesConst*
valueB: *
dtype0

boolean_mask_1/ProdProdboolean_mask_1/strided_slice%boolean_mask_1/Prod/reduction_indices*

Tidx0*
	keep_dims( *
T0
=
boolean_mask_1/Shape_1ShapeMax*
T0*
out_type0
R
$boolean_mask_1/strided_slice_1/stackConst*
valueB:*
dtype0
T
&boolean_mask_1/strided_slice_1/stack_1Const*
valueB: *
dtype0
T
&boolean_mask_1/strided_slice_1/stack_2Const*
valueB:*
dtype0
¶
boolean_mask_1/strided_slice_1StridedSliceboolean_mask_1/Shape_1$boolean_mask_1/strided_slice_1/stack&boolean_mask_1/strided_slice_1/stack_1&boolean_mask_1/strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask
Y
boolean_mask_1/concat/values_0Packboolean_mask_1/Prod*
T0*

axis *
N
D
boolean_mask_1/concat/axisConst*
value	B : *
dtype0

boolean_mask_1/concatConcatV2boolean_mask_1/concat/values_0boolean_mask_1/strided_slice_1boolean_mask_1/concat/axis*

Tidx0*
T0*
N
T
boolean_mask_1/ReshapeReshapeMaxboolean_mask_1/concat*
T0*
Tshape0
U
boolean_mask_1/Reshape_1/shapeConst*
valueB:
ÿÿÿÿÿÿÿÿÿ*
dtype0
h
boolean_mask_1/Reshape_1ReshapeGreaterEqualboolean_mask_1/Reshape_1/shape*
T0
*
Tshape0
@
boolean_mask_1/WhereWhereboolean_mask_1/Reshape_1*
T0

W
boolean_mask_1/SqueezeSqueezeboolean_mask_1/Where*
squeeze_dims
*
T0	

boolean_mask_1/GatherGatherboolean_mask_1/Reshapeboolean_mask_1/Squeeze*
Tindices0	*
Tparams0*
validate_indices(
>
boolean_mask_2/ShapeShapeArgMax*
T0	*
out_type0
P
"boolean_mask_2/strided_slice/stackConst*
valueB: *
dtype0
R
$boolean_mask_2/strided_slice/stack_1Const*
valueB:*
dtype0
R
$boolean_mask_2/strided_slice/stack_2Const*
valueB:*
dtype0
¬
boolean_mask_2/strided_sliceStridedSliceboolean_mask_2/Shape"boolean_mask_2/strided_slice/stack$boolean_mask_2/strided_slice/stack_1$boolean_mask_2/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask 
S
%boolean_mask_2/Prod/reduction_indicesConst*
valueB: *
dtype0

boolean_mask_2/ProdProdboolean_mask_2/strided_slice%boolean_mask_2/Prod/reduction_indices*

Tidx0*
	keep_dims( *
T0
@
boolean_mask_2/Shape_1ShapeArgMax*
T0	*
out_type0
R
$boolean_mask_2/strided_slice_1/stackConst*
valueB:*
dtype0
T
&boolean_mask_2/strided_slice_1/stack_1Const*
valueB: *
dtype0
T
&boolean_mask_2/strided_slice_1/stack_2Const*
valueB:*
dtype0
¶
boolean_mask_2/strided_slice_1StridedSliceboolean_mask_2/Shape_1$boolean_mask_2/strided_slice_1/stack&boolean_mask_2/strided_slice_1/stack_1&boolean_mask_2/strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask
Y
boolean_mask_2/concat/values_0Packboolean_mask_2/Prod*
T0*

axis *
N
D
boolean_mask_2/concat/axisConst*
value	B : *
dtype0

boolean_mask_2/concatConcatV2boolean_mask_2/concat/values_0boolean_mask_2/strided_slice_1boolean_mask_2/concat/axis*

Tidx0*
T0*
N
W
boolean_mask_2/ReshapeReshapeArgMaxboolean_mask_2/concat*
T0	*
Tshape0
U
boolean_mask_2/Reshape_1/shapeConst*
valueB:
ÿÿÿÿÿÿÿÿÿ*
dtype0
h
boolean_mask_2/Reshape_1ReshapeGreaterEqualboolean_mask_2/Reshape_1/shape*
T0
*
Tshape0
@
boolean_mask_2/WhereWhereboolean_mask_2/Reshape_1*
T0

W
boolean_mask_2/SqueezeSqueezeboolean_mask_2/Where*
squeeze_dims
*
T0	

boolean_mask_2/GatherGatherboolean_mask_2/Reshapeboolean_mask_2/Squeeze*
Tindices0	*
Tparams0	*
validate_indices(
D
strided_slice_20/stackConst*
valueB: *
dtype0
F
strided_slice_20/stack_1Const*
valueB:*
dtype0
F
strided_slice_20/stack_2Const*
valueB:*
dtype0
÷
strided_slice_20StridedSlicePlaceholder_112strided_slice_20/stackstrided_slice_20/stack_1strided_slice_20/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
D
strided_slice_21/stackConst*
valueB:*
dtype0
F
strided_slice_21/stack_1Const*
valueB:*
dtype0
F
strided_slice_21/stack_2Const*
valueB:*
dtype0
÷
strided_slice_21StridedSlicePlaceholder_112strided_slice_21/stackstrided_slice_21/stack_1strided_slice_21/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
s
stackPackstrided_slice_20strided_slice_21strided_slice_20strided_slice_21*
T0*

axis *
N
D
Reshape_6/shapeConst*
valueB"      *
dtype0
C
	Reshape_6ReshapestackReshape_6/shape*
T0*
Tshape0
5
mul_2Mulboolean_mask/Gather	Reshape_6*
T0
B
Variable_1/initial_valueConst*
value	B :
*
dtype0
V

Variable_1
VariableV2*
shape: *
shared_name *
dtype0*
	container 

Variable_1/AssignAssign
Variable_1Variable_1/initial_value*
use_locking(*
T0*
_class
loc:@Variable_1*
validate_shape(
O
Variable_1/readIdentity
Variable_1*
T0*
_class
loc:@Variable_1
f
IsVariableInitialized_112IsVariableInitializedVariable*
_class
loc:@Variable*
dtype0
j
IsVariableInitialized_113IsVariableInitialized
Variable_1*
_class
loc:@Variable_1*
dtype0
4
init_1NoOp^Variable/Assign^Variable_1/Assign
"
init_2NoOp^Variable_1/Assign
N
!non_max_suppression/iou_thresholdConst*
valueB
 *   ?*
dtype0

'non_max_suppression/NonMaxSuppressionV2NonMaxSuppressionV2mul_2boolean_mask_1/GatherVariable_1/read!non_max_suppression/iou_threshold*
T0
w
GatherGathermul_2'non_max_suppression/NonMaxSuppressionV2*
Tindices0*
Tparams0*
validate_indices(

Gather_1Gatherboolean_mask_1/Gather'non_max_suppression/NonMaxSuppressionV2*
Tindices0*
Tparams0*
validate_indices(

Gather_2Gatherboolean_mask_2/Gather'non_max_suppression/NonMaxSuppressionV2*
Tindices0*
Tparams0	*
validate_indices(
8

save/ConstConst*
valueB Bmodel*
dtype0
À
save/SaveV2/tensor_namesConst*
valueBpBconv1/kernelBconv1_bn/betaBconv1_bn/gammaBconv1_bn/moving_meanBconv1_bn/moving_varianceBconv2/kernelBconv2_bn/betaBconv2_bn/gammaBconv2_bn/moving_meanBconv2_bn/moving_varianceBconv3_1/kernelBconv3_1_bn/betaBconv3_1_bn/gammaBconv3_1_bn/moving_meanBconv3_1_bn/moving_varianceBconv3_2/kernelBconv3_2_bn/betaBconv3_2_bn/gammaBconv3_2_bn/moving_meanBconv3_2_bn/moving_varianceBconv3_3/kernelBconv3_3_bn/betaBconv3_3_bn/gammaBconv3_3_bn/moving_meanBconv3_3_bn/moving_varianceBconv4_1/kernelBconv4_1_bn/betaBconv4_1_bn/gammaBconv4_1_bn/moving_meanBconv4_1_bn/moving_varianceBconv4_2/kernelBconv4_2_bn/betaBconv4_2_bn/gammaBconv4_2_bn/moving_meanBconv4_2_bn/moving_varianceBconv4_3/kernelBconv4_3_bn/betaBconv4_3_bn/gammaBconv4_3_bn/moving_meanBconv4_3_bn/moving_varianceBconv5_1/kernelBconv5_1_bn/betaBconv5_1_bn/gammaBconv5_1_bn/moving_meanBconv5_1_bn/moving_varianceBconv5_2/kernelBconv5_2_bn/betaBconv5_2_bn/gammaBconv5_2_bn/moving_meanBconv5_2_bn/moving_varianceBconv5_3/kernelBconv5_3_bn/betaBconv5_3_bn/gammaBconv5_3_bn/moving_meanBconv5_3_bn/moving_varianceBconv5_4/kernelBconv5_4_bn/betaBconv5_4_bn/gammaBconv5_4_bn/moving_meanBconv5_4_bn/moving_varianceBconv5_5/kernelBconv5_5_bn/betaBconv5_5_bn/gammaBconv5_5_bn/moving_meanBconv5_5_bn/moving_varianceBconv6_1/kernelBconv6_1_bn/betaBconv6_1_bn/gammaBconv6_1_bn/moving_meanBconv6_1_bn/moving_varianceBconv6_2/kernelBconv6_2_bn/betaBconv6_2_bn/gammaBconv6_2_bn/moving_meanBconv6_2_bn/moving_varianceBconv6_3/kernelBconv6_3_bn/betaBconv6_3_bn/gammaBconv6_3_bn/moving_meanBconv6_3_bn/moving_varianceBconv6_4/kernelBconv6_4_bn/betaBconv6_4_bn/gammaBconv6_4_bn/moving_meanBconv6_4_bn/moving_varianceBconv6_5/kernelBconv6_5_bn/betaBconv6_5_bn/gammaBconv6_5_bn/moving_meanBconv6_5_bn/moving_varianceBconv7_1/kernelBconv7_1_bn/betaBconv7_1_bn/gammaBconv7_1_bn/moving_meanBconv7_1_bn/moving_varianceBconv7_2/kernelBconv7_2_bn/betaBconv7_2_bn/gammaBconv7_2_bn/moving_meanBconv7_2_bn/moving_varianceBconv8/kernelBconv8_bn/betaBconv8_bn/gammaBconv8_bn/moving_meanBconv8_bn/moving_varianceBconv_dec/biasBconv_dec/kernelBconv_shortcut/kernelBconv_shortcut_bn/betaBconv_shortcut_bn/gammaBconv_shortcut_bn/moving_meanB conv_shortcut_bn/moving_variance*
dtype0
ª
save/SaveV2/shape_and_slicesConst*õ
valueëBèpB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
ô
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesconv2d_1/kernelbatch_normalization_1/betabatch_normalization_1/gamma!batch_normalization_1/moving_mean%batch_normalization_1/moving_varianceconv2d_2/kernelbatch_normalization_2/betabatch_normalization_2/gamma!batch_normalization_2/moving_mean%batch_normalization_2/moving_varianceconv2d_3/kernelbatch_normalization_3/betabatch_normalization_3/gamma!batch_normalization_3/moving_mean%batch_normalization_3/moving_varianceconv2d_4/kernelbatch_normalization_4/betabatch_normalization_4/gamma!batch_normalization_4/moving_mean%batch_normalization_4/moving_varianceconv2d_5/kernelbatch_normalization_5/betabatch_normalization_5/gamma!batch_normalization_5/moving_mean%batch_normalization_5/moving_varianceconv2d_6/kernelbatch_normalization_6/betabatch_normalization_6/gamma!batch_normalization_6/moving_mean%batch_normalization_6/moving_varianceconv2d_7/kernelbatch_normalization_7/betabatch_normalization_7/gamma!batch_normalization_7/moving_mean%batch_normalization_7/moving_varianceconv2d_8/kernelbatch_normalization_8/betabatch_normalization_8/gamma!batch_normalization_8/moving_mean%batch_normalization_8/moving_varianceconv2d_9/kernelbatch_normalization_9/betabatch_normalization_9/gamma!batch_normalization_9/moving_mean%batch_normalization_9/moving_varianceconv2d_10/kernelbatch_normalization_10/betabatch_normalization_10/gamma"batch_normalization_10/moving_mean&batch_normalization_10/moving_varianceconv2d_11/kernelbatch_normalization_11/betabatch_normalization_11/gamma"batch_normalization_11/moving_mean&batch_normalization_11/moving_varianceconv2d_12/kernelbatch_normalization_12/betabatch_normalization_12/gamma"batch_normalization_12/moving_mean&batch_normalization_12/moving_varianceconv2d_13/kernelbatch_normalization_13/betabatch_normalization_13/gamma"batch_normalization_13/moving_mean&batch_normalization_13/moving_varianceconv2d_14/kernelbatch_normalization_14/betabatch_normalization_14/gamma"batch_normalization_14/moving_mean&batch_normalization_14/moving_varianceconv2d_15/kernelbatch_normalization_15/betabatch_normalization_15/gamma"batch_normalization_15/moving_mean&batch_normalization_15/moving_varianceconv2d_16/kernelbatch_normalization_16/betabatch_normalization_16/gamma"batch_normalization_16/moving_mean&batch_normalization_16/moving_varianceconv2d_17/kernelbatch_normalization_17/betabatch_normalization_17/gamma"batch_normalization_17/moving_mean&batch_normalization_17/moving_varianceconv2d_18/kernelbatch_normalization_18/betabatch_normalization_18/gamma"batch_normalization_18/moving_mean&batch_normalization_18/moving_varianceconv2d_19/kernelbatch_normalization_19/betabatch_normalization_19/gamma"batch_normalization_19/moving_mean&batch_normalization_19/moving_varianceconv2d_20/kernelbatch_normalization_20/betabatch_normalization_20/gamma"batch_normalization_20/moving_mean&batch_normalization_20/moving_varianceconv2d_22/kernelbatch_normalization_22/betabatch_normalization_22/gamma"batch_normalization_22/moving_mean&batch_normalization_22/moving_varianceconv2d_23/biasconv2d_23/kernelconv2d_21/kernelbatch_normalization_21/betabatch_normalization_21/gamma"batch_normalization_21/moving_mean&batch_normalization_21/moving_variance*~
dtypest
r2p
e
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const
T
save/RestoreV2/tensor_namesConst*!
valueBBconv1/kernel*
dtype0
L
save/RestoreV2/shape_and_slicesConst*
valueB
B *
dtype0
v
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
dtypes
2

save/AssignAssignconv2d_1/kernelsave/RestoreV2*
use_locking(*
T0*"
_class
loc:@conv2d_1/kernel*
validate_shape(
W
save/RestoreV2_1/tensor_namesConst*"
valueBBconv1_bn/beta*
dtype0
N
!save/RestoreV2_1/shape_and_slicesConst*
valueB
B *
dtype0
|
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
dtypes
2
¦
save/Assign_1Assignbatch_normalization_1/betasave/RestoreV2_1*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_1/beta*
validate_shape(
X
save/RestoreV2_2/tensor_namesConst*#
valueBBconv1_bn/gamma*
dtype0
N
!save/RestoreV2_2/shape_and_slicesConst*
valueB
B *
dtype0
|
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
dtypes
2
¨
save/Assign_2Assignbatch_normalization_1/gammasave/RestoreV2_2*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_1/gamma*
validate_shape(
^
save/RestoreV2_3/tensor_namesConst*)
value BBconv1_bn/moving_mean*
dtype0
N
!save/RestoreV2_3/shape_and_slicesConst*
valueB
B *
dtype0
|
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
dtypes
2
´
save/Assign_3Assign!batch_normalization_1/moving_meansave/RestoreV2_3*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean*
validate_shape(
b
save/RestoreV2_4/tensor_namesConst*-
value$B"Bconv1_bn/moving_variance*
dtype0
N
!save/RestoreV2_4/shape_and_slicesConst*
valueB
B *
dtype0
|
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
dtypes
2
¼
save/Assign_4Assign%batch_normalization_1/moving_variancesave/RestoreV2_4*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
validate_shape(
V
save/RestoreV2_5/tensor_namesConst*!
valueBBconv2/kernel*
dtype0
N
!save/RestoreV2_5/shape_and_slicesConst*
valueB
B *
dtype0
|
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
dtypes
2

save/Assign_5Assignconv2d_2/kernelsave/RestoreV2_5*
use_locking(*
T0*"
_class
loc:@conv2d_2/kernel*
validate_shape(
W
save/RestoreV2_6/tensor_namesConst*"
valueBBconv2_bn/beta*
dtype0
N
!save/RestoreV2_6/shape_and_slicesConst*
valueB
B *
dtype0
|
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
dtypes
2
¦
save/Assign_6Assignbatch_normalization_2/betasave/RestoreV2_6*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_2/beta*
validate_shape(
X
save/RestoreV2_7/tensor_namesConst*#
valueBBconv2_bn/gamma*
dtype0
N
!save/RestoreV2_7/shape_and_slicesConst*
valueB
B *
dtype0
|
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
dtypes
2
¨
save/Assign_7Assignbatch_normalization_2/gammasave/RestoreV2_7*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_2/gamma*
validate_shape(
^
save/RestoreV2_8/tensor_namesConst*)
value BBconv2_bn/moving_mean*
dtype0
N
!save/RestoreV2_8/shape_and_slicesConst*
valueB
B *
dtype0
|
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
dtypes
2
´
save/Assign_8Assign!batch_normalization_2/moving_meansave/RestoreV2_8*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean*
validate_shape(
b
save/RestoreV2_9/tensor_namesConst*-
value$B"Bconv2_bn/moving_variance*
dtype0
N
!save/RestoreV2_9/shape_and_slicesConst*
valueB
B *
dtype0
|
save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
dtypes
2
¼
save/Assign_9Assign%batch_normalization_2/moving_variancesave/RestoreV2_9*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance*
validate_shape(
Y
save/RestoreV2_10/tensor_namesConst*#
valueBBconv3_1/kernel*
dtype0
O
"save/RestoreV2_10/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
dtypes
2

save/Assign_10Assignconv2d_3/kernelsave/RestoreV2_10*
use_locking(*
T0*"
_class
loc:@conv2d_3/kernel*
validate_shape(
Z
save/RestoreV2_11/tensor_namesConst*$
valueBBconv3_1_bn/beta*
dtype0
O
"save/RestoreV2_11/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
dtypes
2
¨
save/Assign_11Assignbatch_normalization_3/betasave/RestoreV2_11*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_3/beta*
validate_shape(
[
save/RestoreV2_12/tensor_namesConst*%
valueBBconv3_1_bn/gamma*
dtype0
O
"save/RestoreV2_12/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
dtypes
2
ª
save/Assign_12Assignbatch_normalization_3/gammasave/RestoreV2_12*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_3/gamma*
validate_shape(
a
save/RestoreV2_13/tensor_namesConst*+
value"B Bconv3_1_bn/moving_mean*
dtype0
O
"save/RestoreV2_13/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
dtypes
2
¶
save/Assign_13Assign!batch_normalization_3/moving_meansave/RestoreV2_13*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean*
validate_shape(
e
save/RestoreV2_14/tensor_namesConst*/
value&B$Bconv3_1_bn/moving_variance*
dtype0
O
"save/RestoreV2_14/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
dtypes
2
¾
save/Assign_14Assign%batch_normalization_3/moving_variancesave/RestoreV2_14*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance*
validate_shape(
Y
save/RestoreV2_15/tensor_namesConst*#
valueBBconv3_2/kernel*
dtype0
O
"save/RestoreV2_15/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_15	RestoreV2
save/Constsave/RestoreV2_15/tensor_names"save/RestoreV2_15/shape_and_slices*
dtypes
2

save/Assign_15Assignconv2d_4/kernelsave/RestoreV2_15*
use_locking(*
T0*"
_class
loc:@conv2d_4/kernel*
validate_shape(
Z
save/RestoreV2_16/tensor_namesConst*$
valueBBconv3_2_bn/beta*
dtype0
O
"save/RestoreV2_16/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_16	RestoreV2
save/Constsave/RestoreV2_16/tensor_names"save/RestoreV2_16/shape_and_slices*
dtypes
2
¨
save/Assign_16Assignbatch_normalization_4/betasave/RestoreV2_16*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_4/beta*
validate_shape(
[
save/RestoreV2_17/tensor_namesConst*%
valueBBconv3_2_bn/gamma*
dtype0
O
"save/RestoreV2_17/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_17	RestoreV2
save/Constsave/RestoreV2_17/tensor_names"save/RestoreV2_17/shape_and_slices*
dtypes
2
ª
save/Assign_17Assignbatch_normalization_4/gammasave/RestoreV2_17*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_4/gamma*
validate_shape(
a
save/RestoreV2_18/tensor_namesConst*+
value"B Bconv3_2_bn/moving_mean*
dtype0
O
"save/RestoreV2_18/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_18	RestoreV2
save/Constsave/RestoreV2_18/tensor_names"save/RestoreV2_18/shape_and_slices*
dtypes
2
¶
save/Assign_18Assign!batch_normalization_4/moving_meansave/RestoreV2_18*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_4/moving_mean*
validate_shape(
e
save/RestoreV2_19/tensor_namesConst*/
value&B$Bconv3_2_bn/moving_variance*
dtype0
O
"save/RestoreV2_19/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_19	RestoreV2
save/Constsave/RestoreV2_19/tensor_names"save/RestoreV2_19/shape_and_slices*
dtypes
2
¾
save/Assign_19Assign%batch_normalization_4/moving_variancesave/RestoreV2_19*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_4/moving_variance*
validate_shape(
Y
save/RestoreV2_20/tensor_namesConst*#
valueBBconv3_3/kernel*
dtype0
O
"save/RestoreV2_20/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_20	RestoreV2
save/Constsave/RestoreV2_20/tensor_names"save/RestoreV2_20/shape_and_slices*
dtypes
2

save/Assign_20Assignconv2d_5/kernelsave/RestoreV2_20*
use_locking(*
T0*"
_class
loc:@conv2d_5/kernel*
validate_shape(
Z
save/RestoreV2_21/tensor_namesConst*$
valueBBconv3_3_bn/beta*
dtype0
O
"save/RestoreV2_21/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_21	RestoreV2
save/Constsave/RestoreV2_21/tensor_names"save/RestoreV2_21/shape_and_slices*
dtypes
2
¨
save/Assign_21Assignbatch_normalization_5/betasave/RestoreV2_21*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_5/beta*
validate_shape(
[
save/RestoreV2_22/tensor_namesConst*%
valueBBconv3_3_bn/gamma*
dtype0
O
"save/RestoreV2_22/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_22	RestoreV2
save/Constsave/RestoreV2_22/tensor_names"save/RestoreV2_22/shape_and_slices*
dtypes
2
ª
save/Assign_22Assignbatch_normalization_5/gammasave/RestoreV2_22*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_5/gamma*
validate_shape(
a
save/RestoreV2_23/tensor_namesConst*+
value"B Bconv3_3_bn/moving_mean*
dtype0
O
"save/RestoreV2_23/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_23	RestoreV2
save/Constsave/RestoreV2_23/tensor_names"save/RestoreV2_23/shape_and_slices*
dtypes
2
¶
save/Assign_23Assign!batch_normalization_5/moving_meansave/RestoreV2_23*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_5/moving_mean*
validate_shape(
e
save/RestoreV2_24/tensor_namesConst*/
value&B$Bconv3_3_bn/moving_variance*
dtype0
O
"save/RestoreV2_24/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_24	RestoreV2
save/Constsave/RestoreV2_24/tensor_names"save/RestoreV2_24/shape_and_slices*
dtypes
2
¾
save/Assign_24Assign%batch_normalization_5/moving_variancesave/RestoreV2_24*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_5/moving_variance*
validate_shape(
Y
save/RestoreV2_25/tensor_namesConst*#
valueBBconv4_1/kernel*
dtype0
O
"save/RestoreV2_25/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_25	RestoreV2
save/Constsave/RestoreV2_25/tensor_names"save/RestoreV2_25/shape_and_slices*
dtypes
2

save/Assign_25Assignconv2d_6/kernelsave/RestoreV2_25*
use_locking(*
T0*"
_class
loc:@conv2d_6/kernel*
validate_shape(
Z
save/RestoreV2_26/tensor_namesConst*$
valueBBconv4_1_bn/beta*
dtype0
O
"save/RestoreV2_26/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_26	RestoreV2
save/Constsave/RestoreV2_26/tensor_names"save/RestoreV2_26/shape_and_slices*
dtypes
2
¨
save/Assign_26Assignbatch_normalization_6/betasave/RestoreV2_26*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_6/beta*
validate_shape(
[
save/RestoreV2_27/tensor_namesConst*%
valueBBconv4_1_bn/gamma*
dtype0
O
"save/RestoreV2_27/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_27	RestoreV2
save/Constsave/RestoreV2_27/tensor_names"save/RestoreV2_27/shape_and_slices*
dtypes
2
ª
save/Assign_27Assignbatch_normalization_6/gammasave/RestoreV2_27*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_6/gamma*
validate_shape(
a
save/RestoreV2_28/tensor_namesConst*+
value"B Bconv4_1_bn/moving_mean*
dtype0
O
"save/RestoreV2_28/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_28	RestoreV2
save/Constsave/RestoreV2_28/tensor_names"save/RestoreV2_28/shape_and_slices*
dtypes
2
¶
save/Assign_28Assign!batch_normalization_6/moving_meansave/RestoreV2_28*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_6/moving_mean*
validate_shape(
e
save/RestoreV2_29/tensor_namesConst*/
value&B$Bconv4_1_bn/moving_variance*
dtype0
O
"save/RestoreV2_29/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_29	RestoreV2
save/Constsave/RestoreV2_29/tensor_names"save/RestoreV2_29/shape_and_slices*
dtypes
2
¾
save/Assign_29Assign%batch_normalization_6/moving_variancesave/RestoreV2_29*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_6/moving_variance*
validate_shape(
Y
save/RestoreV2_30/tensor_namesConst*#
valueBBconv4_2/kernel*
dtype0
O
"save/RestoreV2_30/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_30	RestoreV2
save/Constsave/RestoreV2_30/tensor_names"save/RestoreV2_30/shape_and_slices*
dtypes
2

save/Assign_30Assignconv2d_7/kernelsave/RestoreV2_30*
use_locking(*
T0*"
_class
loc:@conv2d_7/kernel*
validate_shape(
Z
save/RestoreV2_31/tensor_namesConst*$
valueBBconv4_2_bn/beta*
dtype0
O
"save/RestoreV2_31/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_31	RestoreV2
save/Constsave/RestoreV2_31/tensor_names"save/RestoreV2_31/shape_and_slices*
dtypes
2
¨
save/Assign_31Assignbatch_normalization_7/betasave/RestoreV2_31*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_7/beta*
validate_shape(
[
save/RestoreV2_32/tensor_namesConst*%
valueBBconv4_2_bn/gamma*
dtype0
O
"save/RestoreV2_32/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_32	RestoreV2
save/Constsave/RestoreV2_32/tensor_names"save/RestoreV2_32/shape_and_slices*
dtypes
2
ª
save/Assign_32Assignbatch_normalization_7/gammasave/RestoreV2_32*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_7/gamma*
validate_shape(
a
save/RestoreV2_33/tensor_namesConst*+
value"B Bconv4_2_bn/moving_mean*
dtype0
O
"save/RestoreV2_33/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_33	RestoreV2
save/Constsave/RestoreV2_33/tensor_names"save/RestoreV2_33/shape_and_slices*
dtypes
2
¶
save/Assign_33Assign!batch_normalization_7/moving_meansave/RestoreV2_33*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_7/moving_mean*
validate_shape(
e
save/RestoreV2_34/tensor_namesConst*/
value&B$Bconv4_2_bn/moving_variance*
dtype0
O
"save/RestoreV2_34/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_34	RestoreV2
save/Constsave/RestoreV2_34/tensor_names"save/RestoreV2_34/shape_and_slices*
dtypes
2
¾
save/Assign_34Assign%batch_normalization_7/moving_variancesave/RestoreV2_34*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_7/moving_variance*
validate_shape(
Y
save/RestoreV2_35/tensor_namesConst*#
valueBBconv4_3/kernel*
dtype0
O
"save/RestoreV2_35/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_35	RestoreV2
save/Constsave/RestoreV2_35/tensor_names"save/RestoreV2_35/shape_and_slices*
dtypes
2

save/Assign_35Assignconv2d_8/kernelsave/RestoreV2_35*
use_locking(*
T0*"
_class
loc:@conv2d_8/kernel*
validate_shape(
Z
save/RestoreV2_36/tensor_namesConst*$
valueBBconv4_3_bn/beta*
dtype0
O
"save/RestoreV2_36/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_36	RestoreV2
save/Constsave/RestoreV2_36/tensor_names"save/RestoreV2_36/shape_and_slices*
dtypes
2
¨
save/Assign_36Assignbatch_normalization_8/betasave/RestoreV2_36*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_8/beta*
validate_shape(
[
save/RestoreV2_37/tensor_namesConst*%
valueBBconv4_3_bn/gamma*
dtype0
O
"save/RestoreV2_37/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_37	RestoreV2
save/Constsave/RestoreV2_37/tensor_names"save/RestoreV2_37/shape_and_slices*
dtypes
2
ª
save/Assign_37Assignbatch_normalization_8/gammasave/RestoreV2_37*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_8/gamma*
validate_shape(
a
save/RestoreV2_38/tensor_namesConst*+
value"B Bconv4_3_bn/moving_mean*
dtype0
O
"save/RestoreV2_38/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_38	RestoreV2
save/Constsave/RestoreV2_38/tensor_names"save/RestoreV2_38/shape_and_slices*
dtypes
2
¶
save/Assign_38Assign!batch_normalization_8/moving_meansave/RestoreV2_38*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_8/moving_mean*
validate_shape(
e
save/RestoreV2_39/tensor_namesConst*/
value&B$Bconv4_3_bn/moving_variance*
dtype0
O
"save/RestoreV2_39/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_39	RestoreV2
save/Constsave/RestoreV2_39/tensor_names"save/RestoreV2_39/shape_and_slices*
dtypes
2
¾
save/Assign_39Assign%batch_normalization_8/moving_variancesave/RestoreV2_39*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_8/moving_variance*
validate_shape(
Y
save/RestoreV2_40/tensor_namesConst*#
valueBBconv5_1/kernel*
dtype0
O
"save/RestoreV2_40/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_40	RestoreV2
save/Constsave/RestoreV2_40/tensor_names"save/RestoreV2_40/shape_and_slices*
dtypes
2

save/Assign_40Assignconv2d_9/kernelsave/RestoreV2_40*
use_locking(*
T0*"
_class
loc:@conv2d_9/kernel*
validate_shape(
Z
save/RestoreV2_41/tensor_namesConst*$
valueBBconv5_1_bn/beta*
dtype0
O
"save/RestoreV2_41/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_41	RestoreV2
save/Constsave/RestoreV2_41/tensor_names"save/RestoreV2_41/shape_and_slices*
dtypes
2
¨
save/Assign_41Assignbatch_normalization_9/betasave/RestoreV2_41*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_9/beta*
validate_shape(
[
save/RestoreV2_42/tensor_namesConst*%
valueBBconv5_1_bn/gamma*
dtype0
O
"save/RestoreV2_42/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_42	RestoreV2
save/Constsave/RestoreV2_42/tensor_names"save/RestoreV2_42/shape_and_slices*
dtypes
2
ª
save/Assign_42Assignbatch_normalization_9/gammasave/RestoreV2_42*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_9/gamma*
validate_shape(
a
save/RestoreV2_43/tensor_namesConst*+
value"B Bconv5_1_bn/moving_mean*
dtype0
O
"save/RestoreV2_43/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_43	RestoreV2
save/Constsave/RestoreV2_43/tensor_names"save/RestoreV2_43/shape_and_slices*
dtypes
2
¶
save/Assign_43Assign!batch_normalization_9/moving_meansave/RestoreV2_43*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_9/moving_mean*
validate_shape(
e
save/RestoreV2_44/tensor_namesConst*/
value&B$Bconv5_1_bn/moving_variance*
dtype0
O
"save/RestoreV2_44/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_44	RestoreV2
save/Constsave/RestoreV2_44/tensor_names"save/RestoreV2_44/shape_and_slices*
dtypes
2
¾
save/Assign_44Assign%batch_normalization_9/moving_variancesave/RestoreV2_44*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_9/moving_variance*
validate_shape(
Y
save/RestoreV2_45/tensor_namesConst*#
valueBBconv5_2/kernel*
dtype0
O
"save/RestoreV2_45/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_45	RestoreV2
save/Constsave/RestoreV2_45/tensor_names"save/RestoreV2_45/shape_and_slices*
dtypes
2

save/Assign_45Assignconv2d_10/kernelsave/RestoreV2_45*
use_locking(*
T0*#
_class
loc:@conv2d_10/kernel*
validate_shape(
Z
save/RestoreV2_46/tensor_namesConst*$
valueBBconv5_2_bn/beta*
dtype0
O
"save/RestoreV2_46/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_46	RestoreV2
save/Constsave/RestoreV2_46/tensor_names"save/RestoreV2_46/shape_and_slices*
dtypes
2
ª
save/Assign_46Assignbatch_normalization_10/betasave/RestoreV2_46*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_10/beta*
validate_shape(
[
save/RestoreV2_47/tensor_namesConst*%
valueBBconv5_2_bn/gamma*
dtype0
O
"save/RestoreV2_47/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_47	RestoreV2
save/Constsave/RestoreV2_47/tensor_names"save/RestoreV2_47/shape_and_slices*
dtypes
2
¬
save/Assign_47Assignbatch_normalization_10/gammasave/RestoreV2_47*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_10/gamma*
validate_shape(
a
save/RestoreV2_48/tensor_namesConst*+
value"B Bconv5_2_bn/moving_mean*
dtype0
O
"save/RestoreV2_48/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_48	RestoreV2
save/Constsave/RestoreV2_48/tensor_names"save/RestoreV2_48/shape_and_slices*
dtypes
2
¸
save/Assign_48Assign"batch_normalization_10/moving_meansave/RestoreV2_48*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_10/moving_mean*
validate_shape(
e
save/RestoreV2_49/tensor_namesConst*/
value&B$Bconv5_2_bn/moving_variance*
dtype0
O
"save/RestoreV2_49/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_49	RestoreV2
save/Constsave/RestoreV2_49/tensor_names"save/RestoreV2_49/shape_and_slices*
dtypes
2
À
save/Assign_49Assign&batch_normalization_10/moving_variancesave/RestoreV2_49*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_10/moving_variance*
validate_shape(
Y
save/RestoreV2_50/tensor_namesConst*#
valueBBconv5_3/kernel*
dtype0
O
"save/RestoreV2_50/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_50	RestoreV2
save/Constsave/RestoreV2_50/tensor_names"save/RestoreV2_50/shape_and_slices*
dtypes
2

save/Assign_50Assignconv2d_11/kernelsave/RestoreV2_50*
use_locking(*
T0*#
_class
loc:@conv2d_11/kernel*
validate_shape(
Z
save/RestoreV2_51/tensor_namesConst*$
valueBBconv5_3_bn/beta*
dtype0
O
"save/RestoreV2_51/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_51	RestoreV2
save/Constsave/RestoreV2_51/tensor_names"save/RestoreV2_51/shape_and_slices*
dtypes
2
ª
save/Assign_51Assignbatch_normalization_11/betasave/RestoreV2_51*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_11/beta*
validate_shape(
[
save/RestoreV2_52/tensor_namesConst*%
valueBBconv5_3_bn/gamma*
dtype0
O
"save/RestoreV2_52/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_52	RestoreV2
save/Constsave/RestoreV2_52/tensor_names"save/RestoreV2_52/shape_and_slices*
dtypes
2
¬
save/Assign_52Assignbatch_normalization_11/gammasave/RestoreV2_52*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_11/gamma*
validate_shape(
a
save/RestoreV2_53/tensor_namesConst*+
value"B Bconv5_3_bn/moving_mean*
dtype0
O
"save/RestoreV2_53/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_53	RestoreV2
save/Constsave/RestoreV2_53/tensor_names"save/RestoreV2_53/shape_and_slices*
dtypes
2
¸
save/Assign_53Assign"batch_normalization_11/moving_meansave/RestoreV2_53*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_11/moving_mean*
validate_shape(
e
save/RestoreV2_54/tensor_namesConst*/
value&B$Bconv5_3_bn/moving_variance*
dtype0
O
"save/RestoreV2_54/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_54	RestoreV2
save/Constsave/RestoreV2_54/tensor_names"save/RestoreV2_54/shape_and_slices*
dtypes
2
À
save/Assign_54Assign&batch_normalization_11/moving_variancesave/RestoreV2_54*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_11/moving_variance*
validate_shape(
Y
save/RestoreV2_55/tensor_namesConst*#
valueBBconv5_4/kernel*
dtype0
O
"save/RestoreV2_55/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_55	RestoreV2
save/Constsave/RestoreV2_55/tensor_names"save/RestoreV2_55/shape_and_slices*
dtypes
2

save/Assign_55Assignconv2d_12/kernelsave/RestoreV2_55*
use_locking(*
T0*#
_class
loc:@conv2d_12/kernel*
validate_shape(
Z
save/RestoreV2_56/tensor_namesConst*$
valueBBconv5_4_bn/beta*
dtype0
O
"save/RestoreV2_56/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_56	RestoreV2
save/Constsave/RestoreV2_56/tensor_names"save/RestoreV2_56/shape_and_slices*
dtypes
2
ª
save/Assign_56Assignbatch_normalization_12/betasave/RestoreV2_56*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_12/beta*
validate_shape(
[
save/RestoreV2_57/tensor_namesConst*%
valueBBconv5_4_bn/gamma*
dtype0
O
"save/RestoreV2_57/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_57	RestoreV2
save/Constsave/RestoreV2_57/tensor_names"save/RestoreV2_57/shape_and_slices*
dtypes
2
¬
save/Assign_57Assignbatch_normalization_12/gammasave/RestoreV2_57*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_12/gamma*
validate_shape(
a
save/RestoreV2_58/tensor_namesConst*+
value"B Bconv5_4_bn/moving_mean*
dtype0
O
"save/RestoreV2_58/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_58	RestoreV2
save/Constsave/RestoreV2_58/tensor_names"save/RestoreV2_58/shape_and_slices*
dtypes
2
¸
save/Assign_58Assign"batch_normalization_12/moving_meansave/RestoreV2_58*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_12/moving_mean*
validate_shape(
e
save/RestoreV2_59/tensor_namesConst*/
value&B$Bconv5_4_bn/moving_variance*
dtype0
O
"save/RestoreV2_59/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_59	RestoreV2
save/Constsave/RestoreV2_59/tensor_names"save/RestoreV2_59/shape_and_slices*
dtypes
2
À
save/Assign_59Assign&batch_normalization_12/moving_variancesave/RestoreV2_59*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_12/moving_variance*
validate_shape(
Y
save/RestoreV2_60/tensor_namesConst*#
valueBBconv5_5/kernel*
dtype0
O
"save/RestoreV2_60/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_60	RestoreV2
save/Constsave/RestoreV2_60/tensor_names"save/RestoreV2_60/shape_and_slices*
dtypes
2

save/Assign_60Assignconv2d_13/kernelsave/RestoreV2_60*
use_locking(*
T0*#
_class
loc:@conv2d_13/kernel*
validate_shape(
Z
save/RestoreV2_61/tensor_namesConst*$
valueBBconv5_5_bn/beta*
dtype0
O
"save/RestoreV2_61/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_61	RestoreV2
save/Constsave/RestoreV2_61/tensor_names"save/RestoreV2_61/shape_and_slices*
dtypes
2
ª
save/Assign_61Assignbatch_normalization_13/betasave/RestoreV2_61*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_13/beta*
validate_shape(
[
save/RestoreV2_62/tensor_namesConst*%
valueBBconv5_5_bn/gamma*
dtype0
O
"save/RestoreV2_62/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_62	RestoreV2
save/Constsave/RestoreV2_62/tensor_names"save/RestoreV2_62/shape_and_slices*
dtypes
2
¬
save/Assign_62Assignbatch_normalization_13/gammasave/RestoreV2_62*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_13/gamma*
validate_shape(
a
save/RestoreV2_63/tensor_namesConst*+
value"B Bconv5_5_bn/moving_mean*
dtype0
O
"save/RestoreV2_63/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_63	RestoreV2
save/Constsave/RestoreV2_63/tensor_names"save/RestoreV2_63/shape_and_slices*
dtypes
2
¸
save/Assign_63Assign"batch_normalization_13/moving_meansave/RestoreV2_63*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_13/moving_mean*
validate_shape(
e
save/RestoreV2_64/tensor_namesConst*/
value&B$Bconv5_5_bn/moving_variance*
dtype0
O
"save/RestoreV2_64/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_64	RestoreV2
save/Constsave/RestoreV2_64/tensor_names"save/RestoreV2_64/shape_and_slices*
dtypes
2
À
save/Assign_64Assign&batch_normalization_13/moving_variancesave/RestoreV2_64*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_13/moving_variance*
validate_shape(
Y
save/RestoreV2_65/tensor_namesConst*#
valueBBconv6_1/kernel*
dtype0
O
"save/RestoreV2_65/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_65	RestoreV2
save/Constsave/RestoreV2_65/tensor_names"save/RestoreV2_65/shape_and_slices*
dtypes
2

save/Assign_65Assignconv2d_14/kernelsave/RestoreV2_65*
use_locking(*
T0*#
_class
loc:@conv2d_14/kernel*
validate_shape(
Z
save/RestoreV2_66/tensor_namesConst*$
valueBBconv6_1_bn/beta*
dtype0
O
"save/RestoreV2_66/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_66	RestoreV2
save/Constsave/RestoreV2_66/tensor_names"save/RestoreV2_66/shape_and_slices*
dtypes
2
ª
save/Assign_66Assignbatch_normalization_14/betasave/RestoreV2_66*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_14/beta*
validate_shape(
[
save/RestoreV2_67/tensor_namesConst*%
valueBBconv6_1_bn/gamma*
dtype0
O
"save/RestoreV2_67/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_67	RestoreV2
save/Constsave/RestoreV2_67/tensor_names"save/RestoreV2_67/shape_and_slices*
dtypes
2
¬
save/Assign_67Assignbatch_normalization_14/gammasave/RestoreV2_67*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_14/gamma*
validate_shape(
a
save/RestoreV2_68/tensor_namesConst*+
value"B Bconv6_1_bn/moving_mean*
dtype0
O
"save/RestoreV2_68/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_68	RestoreV2
save/Constsave/RestoreV2_68/tensor_names"save/RestoreV2_68/shape_and_slices*
dtypes
2
¸
save/Assign_68Assign"batch_normalization_14/moving_meansave/RestoreV2_68*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_14/moving_mean*
validate_shape(
e
save/RestoreV2_69/tensor_namesConst*/
value&B$Bconv6_1_bn/moving_variance*
dtype0
O
"save/RestoreV2_69/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_69	RestoreV2
save/Constsave/RestoreV2_69/tensor_names"save/RestoreV2_69/shape_and_slices*
dtypes
2
À
save/Assign_69Assign&batch_normalization_14/moving_variancesave/RestoreV2_69*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_14/moving_variance*
validate_shape(
Y
save/RestoreV2_70/tensor_namesConst*#
valueBBconv6_2/kernel*
dtype0
O
"save/RestoreV2_70/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_70	RestoreV2
save/Constsave/RestoreV2_70/tensor_names"save/RestoreV2_70/shape_and_slices*
dtypes
2

save/Assign_70Assignconv2d_15/kernelsave/RestoreV2_70*
use_locking(*
T0*#
_class
loc:@conv2d_15/kernel*
validate_shape(
Z
save/RestoreV2_71/tensor_namesConst*$
valueBBconv6_2_bn/beta*
dtype0
O
"save/RestoreV2_71/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_71	RestoreV2
save/Constsave/RestoreV2_71/tensor_names"save/RestoreV2_71/shape_and_slices*
dtypes
2
ª
save/Assign_71Assignbatch_normalization_15/betasave/RestoreV2_71*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_15/beta*
validate_shape(
[
save/RestoreV2_72/tensor_namesConst*%
valueBBconv6_2_bn/gamma*
dtype0
O
"save/RestoreV2_72/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_72	RestoreV2
save/Constsave/RestoreV2_72/tensor_names"save/RestoreV2_72/shape_and_slices*
dtypes
2
¬
save/Assign_72Assignbatch_normalization_15/gammasave/RestoreV2_72*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_15/gamma*
validate_shape(
a
save/RestoreV2_73/tensor_namesConst*+
value"B Bconv6_2_bn/moving_mean*
dtype0
O
"save/RestoreV2_73/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_73	RestoreV2
save/Constsave/RestoreV2_73/tensor_names"save/RestoreV2_73/shape_and_slices*
dtypes
2
¸
save/Assign_73Assign"batch_normalization_15/moving_meansave/RestoreV2_73*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_15/moving_mean*
validate_shape(
e
save/RestoreV2_74/tensor_namesConst*/
value&B$Bconv6_2_bn/moving_variance*
dtype0
O
"save/RestoreV2_74/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_74	RestoreV2
save/Constsave/RestoreV2_74/tensor_names"save/RestoreV2_74/shape_and_slices*
dtypes
2
À
save/Assign_74Assign&batch_normalization_15/moving_variancesave/RestoreV2_74*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_15/moving_variance*
validate_shape(
Y
save/RestoreV2_75/tensor_namesConst*#
valueBBconv6_3/kernel*
dtype0
O
"save/RestoreV2_75/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_75	RestoreV2
save/Constsave/RestoreV2_75/tensor_names"save/RestoreV2_75/shape_and_slices*
dtypes
2

save/Assign_75Assignconv2d_16/kernelsave/RestoreV2_75*
use_locking(*
T0*#
_class
loc:@conv2d_16/kernel*
validate_shape(
Z
save/RestoreV2_76/tensor_namesConst*$
valueBBconv6_3_bn/beta*
dtype0
O
"save/RestoreV2_76/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_76	RestoreV2
save/Constsave/RestoreV2_76/tensor_names"save/RestoreV2_76/shape_and_slices*
dtypes
2
ª
save/Assign_76Assignbatch_normalization_16/betasave/RestoreV2_76*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_16/beta*
validate_shape(
[
save/RestoreV2_77/tensor_namesConst*%
valueBBconv6_3_bn/gamma*
dtype0
O
"save/RestoreV2_77/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_77	RestoreV2
save/Constsave/RestoreV2_77/tensor_names"save/RestoreV2_77/shape_and_slices*
dtypes
2
¬
save/Assign_77Assignbatch_normalization_16/gammasave/RestoreV2_77*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_16/gamma*
validate_shape(
a
save/RestoreV2_78/tensor_namesConst*+
value"B Bconv6_3_bn/moving_mean*
dtype0
O
"save/RestoreV2_78/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_78	RestoreV2
save/Constsave/RestoreV2_78/tensor_names"save/RestoreV2_78/shape_and_slices*
dtypes
2
¸
save/Assign_78Assign"batch_normalization_16/moving_meansave/RestoreV2_78*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_16/moving_mean*
validate_shape(
e
save/RestoreV2_79/tensor_namesConst*/
value&B$Bconv6_3_bn/moving_variance*
dtype0
O
"save/RestoreV2_79/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_79	RestoreV2
save/Constsave/RestoreV2_79/tensor_names"save/RestoreV2_79/shape_and_slices*
dtypes
2
À
save/Assign_79Assign&batch_normalization_16/moving_variancesave/RestoreV2_79*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_16/moving_variance*
validate_shape(
Y
save/RestoreV2_80/tensor_namesConst*#
valueBBconv6_4/kernel*
dtype0
O
"save/RestoreV2_80/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_80	RestoreV2
save/Constsave/RestoreV2_80/tensor_names"save/RestoreV2_80/shape_and_slices*
dtypes
2

save/Assign_80Assignconv2d_17/kernelsave/RestoreV2_80*
use_locking(*
T0*#
_class
loc:@conv2d_17/kernel*
validate_shape(
Z
save/RestoreV2_81/tensor_namesConst*$
valueBBconv6_4_bn/beta*
dtype0
O
"save/RestoreV2_81/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_81	RestoreV2
save/Constsave/RestoreV2_81/tensor_names"save/RestoreV2_81/shape_and_slices*
dtypes
2
ª
save/Assign_81Assignbatch_normalization_17/betasave/RestoreV2_81*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_17/beta*
validate_shape(
[
save/RestoreV2_82/tensor_namesConst*%
valueBBconv6_4_bn/gamma*
dtype0
O
"save/RestoreV2_82/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_82	RestoreV2
save/Constsave/RestoreV2_82/tensor_names"save/RestoreV2_82/shape_and_slices*
dtypes
2
¬
save/Assign_82Assignbatch_normalization_17/gammasave/RestoreV2_82*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_17/gamma*
validate_shape(
a
save/RestoreV2_83/tensor_namesConst*+
value"B Bconv6_4_bn/moving_mean*
dtype0
O
"save/RestoreV2_83/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_83	RestoreV2
save/Constsave/RestoreV2_83/tensor_names"save/RestoreV2_83/shape_and_slices*
dtypes
2
¸
save/Assign_83Assign"batch_normalization_17/moving_meansave/RestoreV2_83*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_17/moving_mean*
validate_shape(
e
save/RestoreV2_84/tensor_namesConst*/
value&B$Bconv6_4_bn/moving_variance*
dtype0
O
"save/RestoreV2_84/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_84	RestoreV2
save/Constsave/RestoreV2_84/tensor_names"save/RestoreV2_84/shape_and_slices*
dtypes
2
À
save/Assign_84Assign&batch_normalization_17/moving_variancesave/RestoreV2_84*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_17/moving_variance*
validate_shape(
Y
save/RestoreV2_85/tensor_namesConst*#
valueBBconv6_5/kernel*
dtype0
O
"save/RestoreV2_85/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_85	RestoreV2
save/Constsave/RestoreV2_85/tensor_names"save/RestoreV2_85/shape_and_slices*
dtypes
2

save/Assign_85Assignconv2d_18/kernelsave/RestoreV2_85*
use_locking(*
T0*#
_class
loc:@conv2d_18/kernel*
validate_shape(
Z
save/RestoreV2_86/tensor_namesConst*$
valueBBconv6_5_bn/beta*
dtype0
O
"save/RestoreV2_86/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_86	RestoreV2
save/Constsave/RestoreV2_86/tensor_names"save/RestoreV2_86/shape_and_slices*
dtypes
2
ª
save/Assign_86Assignbatch_normalization_18/betasave/RestoreV2_86*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_18/beta*
validate_shape(
[
save/RestoreV2_87/tensor_namesConst*%
valueBBconv6_5_bn/gamma*
dtype0
O
"save/RestoreV2_87/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_87	RestoreV2
save/Constsave/RestoreV2_87/tensor_names"save/RestoreV2_87/shape_and_slices*
dtypes
2
¬
save/Assign_87Assignbatch_normalization_18/gammasave/RestoreV2_87*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_18/gamma*
validate_shape(
a
save/RestoreV2_88/tensor_namesConst*+
value"B Bconv6_5_bn/moving_mean*
dtype0
O
"save/RestoreV2_88/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_88	RestoreV2
save/Constsave/RestoreV2_88/tensor_names"save/RestoreV2_88/shape_and_slices*
dtypes
2
¸
save/Assign_88Assign"batch_normalization_18/moving_meansave/RestoreV2_88*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_18/moving_mean*
validate_shape(
e
save/RestoreV2_89/tensor_namesConst*/
value&B$Bconv6_5_bn/moving_variance*
dtype0
O
"save/RestoreV2_89/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_89	RestoreV2
save/Constsave/RestoreV2_89/tensor_names"save/RestoreV2_89/shape_and_slices*
dtypes
2
À
save/Assign_89Assign&batch_normalization_18/moving_variancesave/RestoreV2_89*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_18/moving_variance*
validate_shape(
Y
save/RestoreV2_90/tensor_namesConst*#
valueBBconv7_1/kernel*
dtype0
O
"save/RestoreV2_90/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_90	RestoreV2
save/Constsave/RestoreV2_90/tensor_names"save/RestoreV2_90/shape_and_slices*
dtypes
2

save/Assign_90Assignconv2d_19/kernelsave/RestoreV2_90*
use_locking(*
T0*#
_class
loc:@conv2d_19/kernel*
validate_shape(
Z
save/RestoreV2_91/tensor_namesConst*$
valueBBconv7_1_bn/beta*
dtype0
O
"save/RestoreV2_91/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_91	RestoreV2
save/Constsave/RestoreV2_91/tensor_names"save/RestoreV2_91/shape_and_slices*
dtypes
2
ª
save/Assign_91Assignbatch_normalization_19/betasave/RestoreV2_91*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_19/beta*
validate_shape(
[
save/RestoreV2_92/tensor_namesConst*%
valueBBconv7_1_bn/gamma*
dtype0
O
"save/RestoreV2_92/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_92	RestoreV2
save/Constsave/RestoreV2_92/tensor_names"save/RestoreV2_92/shape_and_slices*
dtypes
2
¬
save/Assign_92Assignbatch_normalization_19/gammasave/RestoreV2_92*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_19/gamma*
validate_shape(
a
save/RestoreV2_93/tensor_namesConst*+
value"B Bconv7_1_bn/moving_mean*
dtype0
O
"save/RestoreV2_93/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_93	RestoreV2
save/Constsave/RestoreV2_93/tensor_names"save/RestoreV2_93/shape_and_slices*
dtypes
2
¸
save/Assign_93Assign"batch_normalization_19/moving_meansave/RestoreV2_93*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_19/moving_mean*
validate_shape(
e
save/RestoreV2_94/tensor_namesConst*/
value&B$Bconv7_1_bn/moving_variance*
dtype0
O
"save/RestoreV2_94/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_94	RestoreV2
save/Constsave/RestoreV2_94/tensor_names"save/RestoreV2_94/shape_and_slices*
dtypes
2
À
save/Assign_94Assign&batch_normalization_19/moving_variancesave/RestoreV2_94*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_19/moving_variance*
validate_shape(
Y
save/RestoreV2_95/tensor_namesConst*#
valueBBconv7_2/kernel*
dtype0
O
"save/RestoreV2_95/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_95	RestoreV2
save/Constsave/RestoreV2_95/tensor_names"save/RestoreV2_95/shape_and_slices*
dtypes
2

save/Assign_95Assignconv2d_20/kernelsave/RestoreV2_95*
use_locking(*
T0*#
_class
loc:@conv2d_20/kernel*
validate_shape(
Z
save/RestoreV2_96/tensor_namesConst*$
valueBBconv7_2_bn/beta*
dtype0
O
"save/RestoreV2_96/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_96	RestoreV2
save/Constsave/RestoreV2_96/tensor_names"save/RestoreV2_96/shape_and_slices*
dtypes
2
ª
save/Assign_96Assignbatch_normalization_20/betasave/RestoreV2_96*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_20/beta*
validate_shape(
[
save/RestoreV2_97/tensor_namesConst*%
valueBBconv7_2_bn/gamma*
dtype0
O
"save/RestoreV2_97/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_97	RestoreV2
save/Constsave/RestoreV2_97/tensor_names"save/RestoreV2_97/shape_and_slices*
dtypes
2
¬
save/Assign_97Assignbatch_normalization_20/gammasave/RestoreV2_97*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_20/gamma*
validate_shape(
a
save/RestoreV2_98/tensor_namesConst*+
value"B Bconv7_2_bn/moving_mean*
dtype0
O
"save/RestoreV2_98/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_98	RestoreV2
save/Constsave/RestoreV2_98/tensor_names"save/RestoreV2_98/shape_and_slices*
dtypes
2
¸
save/Assign_98Assign"batch_normalization_20/moving_meansave/RestoreV2_98*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_20/moving_mean*
validate_shape(
e
save/RestoreV2_99/tensor_namesConst*/
value&B$Bconv7_2_bn/moving_variance*
dtype0
O
"save/RestoreV2_99/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_99	RestoreV2
save/Constsave/RestoreV2_99/tensor_names"save/RestoreV2_99/shape_and_slices*
dtypes
2
À
save/Assign_99Assign&batch_normalization_20/moving_variancesave/RestoreV2_99*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_20/moving_variance*
validate_shape(
X
save/RestoreV2_100/tensor_namesConst*!
valueBBconv8/kernel*
dtype0
P
#save/RestoreV2_100/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_100	RestoreV2
save/Constsave/RestoreV2_100/tensor_names#save/RestoreV2_100/shape_and_slices*
dtypes
2

save/Assign_100Assignconv2d_22/kernelsave/RestoreV2_100*
use_locking(*
T0*#
_class
loc:@conv2d_22/kernel*
validate_shape(
Y
save/RestoreV2_101/tensor_namesConst*"
valueBBconv8_bn/beta*
dtype0
P
#save/RestoreV2_101/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_101	RestoreV2
save/Constsave/RestoreV2_101/tensor_names#save/RestoreV2_101/shape_and_slices*
dtypes
2
¬
save/Assign_101Assignbatch_normalization_22/betasave/RestoreV2_101*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_22/beta*
validate_shape(
Z
save/RestoreV2_102/tensor_namesConst*#
valueBBconv8_bn/gamma*
dtype0
P
#save/RestoreV2_102/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_102	RestoreV2
save/Constsave/RestoreV2_102/tensor_names#save/RestoreV2_102/shape_and_slices*
dtypes
2
®
save/Assign_102Assignbatch_normalization_22/gammasave/RestoreV2_102*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_22/gamma*
validate_shape(
`
save/RestoreV2_103/tensor_namesConst*)
value BBconv8_bn/moving_mean*
dtype0
P
#save/RestoreV2_103/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_103	RestoreV2
save/Constsave/RestoreV2_103/tensor_names#save/RestoreV2_103/shape_and_slices*
dtypes
2
º
save/Assign_103Assign"batch_normalization_22/moving_meansave/RestoreV2_103*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_22/moving_mean*
validate_shape(
d
save/RestoreV2_104/tensor_namesConst*-
value$B"Bconv8_bn/moving_variance*
dtype0
P
#save/RestoreV2_104/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_104	RestoreV2
save/Constsave/RestoreV2_104/tensor_names#save/RestoreV2_104/shape_and_slices*
dtypes
2
Â
save/Assign_104Assign&batch_normalization_22/moving_variancesave/RestoreV2_104*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_22/moving_variance*
validate_shape(
Y
save/RestoreV2_105/tensor_namesConst*"
valueBBconv_dec/bias*
dtype0
P
#save/RestoreV2_105/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_105	RestoreV2
save/Constsave/RestoreV2_105/tensor_names#save/RestoreV2_105/shape_and_slices*
dtypes
2

save/Assign_105Assignconv2d_23/biassave/RestoreV2_105*
use_locking(*
T0*!
_class
loc:@conv2d_23/bias*
validate_shape(
[
save/RestoreV2_106/tensor_namesConst*$
valueBBconv_dec/kernel*
dtype0
P
#save/RestoreV2_106/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_106	RestoreV2
save/Constsave/RestoreV2_106/tensor_names#save/RestoreV2_106/shape_and_slices*
dtypes
2

save/Assign_106Assignconv2d_23/kernelsave/RestoreV2_106*
use_locking(*
T0*#
_class
loc:@conv2d_23/kernel*
validate_shape(
`
save/RestoreV2_107/tensor_namesConst*)
value BBconv_shortcut/kernel*
dtype0
P
#save/RestoreV2_107/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_107	RestoreV2
save/Constsave/RestoreV2_107/tensor_names#save/RestoreV2_107/shape_and_slices*
dtypes
2

save/Assign_107Assignconv2d_21/kernelsave/RestoreV2_107*
use_locking(*
T0*#
_class
loc:@conv2d_21/kernel*
validate_shape(
a
save/RestoreV2_108/tensor_namesConst**
value!BBconv_shortcut_bn/beta*
dtype0
P
#save/RestoreV2_108/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_108	RestoreV2
save/Constsave/RestoreV2_108/tensor_names#save/RestoreV2_108/shape_and_slices*
dtypes
2
¬
save/Assign_108Assignbatch_normalization_21/betasave/RestoreV2_108*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_21/beta*
validate_shape(
b
save/RestoreV2_109/tensor_namesConst*+
value"B Bconv_shortcut_bn/gamma*
dtype0
P
#save/RestoreV2_109/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_109	RestoreV2
save/Constsave/RestoreV2_109/tensor_names#save/RestoreV2_109/shape_and_slices*
dtypes
2
®
save/Assign_109Assignbatch_normalization_21/gammasave/RestoreV2_109*
use_locking(*
T0*/
_class%
#!loc:@batch_normalization_21/gamma*
validate_shape(
h
save/RestoreV2_110/tensor_namesConst*1
value(B&Bconv_shortcut_bn/moving_mean*
dtype0
P
#save/RestoreV2_110/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_110	RestoreV2
save/Constsave/RestoreV2_110/tensor_names#save/RestoreV2_110/shape_and_slices*
dtypes
2
º
save/Assign_110Assign"batch_normalization_21/moving_meansave/RestoreV2_110*
use_locking(*
T0*5
_class+
)'loc:@batch_normalization_21/moving_mean*
validate_shape(
l
save/RestoreV2_111/tensor_namesConst*5
value,B*B conv_shortcut_bn/moving_variance*
dtype0
P
#save/RestoreV2_111/shape_and_slicesConst*
valueB
B *
dtype0

save/RestoreV2_111	RestoreV2
save/Constsave/RestoreV2_111/tensor_names#save/RestoreV2_111/shape_and_slices*
dtypes
2
Â
save/Assign_111Assign&batch_normalization_21/moving_variancesave/RestoreV2_111*
use_locking(*
T0*9
_class/
-+loc:@batch_normalization_21/moving_variance*
validate_shape(

save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_100^save/Assign_101^save/Assign_102^save/Assign_103^save/Assign_104^save/Assign_105^save/Assign_106^save/Assign_107^save/Assign_108^save/Assign_109^save/Assign_11^save/Assign_110^save/Assign_111^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_2^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27^save/Assign_28^save/Assign_29^save/Assign_3^save/Assign_30^save/Assign_31^save/Assign_32^save/Assign_33^save/Assign_34^save/Assign_35^save/Assign_36^save/Assign_37^save/Assign_38^save/Assign_39^save/Assign_4^save/Assign_40^save/Assign_41^save/Assign_42^save/Assign_43^save/Assign_44^save/Assign_45^save/Assign_46^save/Assign_47^save/Assign_48^save/Assign_49^save/Assign_5^save/Assign_50^save/Assign_51^save/Assign_52^save/Assign_53^save/Assign_54^save/Assign_55^save/Assign_56^save/Assign_57^save/Assign_58^save/Assign_59^save/Assign_6^save/Assign_60^save/Assign_61^save/Assign_62^save/Assign_63^save/Assign_64^save/Assign_65^save/Assign_66^save/Assign_67^save/Assign_68^save/Assign_69^save/Assign_7^save/Assign_70^save/Assign_71^save/Assign_72^save/Assign_73^save/Assign_74^save/Assign_75^save/Assign_76^save/Assign_77^save/Assign_78^save/Assign_79^save/Assign_8^save/Assign_80^save/Assign_81^save/Assign_82^save/Assign_83^save/Assign_84^save/Assign_85^save/Assign_86^save/Assign_87^save/Assign_88^save/Assign_89^save/Assign_9^save/Assign_90^save/Assign_91^save/Assign_92^save/Assign_93^save/Assign_94^save/Assign_95^save/Assign_96^save/Assign_97^save/Assign_98^save/Assign_99
Ï!
init_3NoOp^Variable/Assign^Variable_1/Assign"^batch_normalization_1/beta/Assign#^batch_normalization_1/gamma/Assign)^batch_normalization_1/moving_mean/Assign-^batch_normalization_1/moving_variance/Assign#^batch_normalization_10/beta/Assign$^batch_normalization_10/gamma/Assign*^batch_normalization_10/moving_mean/Assign.^batch_normalization_10/moving_variance/Assign#^batch_normalization_11/beta/Assign$^batch_normalization_11/gamma/Assign*^batch_normalization_11/moving_mean/Assign.^batch_normalization_11/moving_variance/Assign#^batch_normalization_12/beta/Assign$^batch_normalization_12/gamma/Assign*^batch_normalization_12/moving_mean/Assign.^batch_normalization_12/moving_variance/Assign#^batch_normalization_13/beta/Assign$^batch_normalization_13/gamma/Assign*^batch_normalization_13/moving_mean/Assign.^batch_normalization_13/moving_variance/Assign#^batch_normalization_14/beta/Assign$^batch_normalization_14/gamma/Assign*^batch_normalization_14/moving_mean/Assign.^batch_normalization_14/moving_variance/Assign#^batch_normalization_15/beta/Assign$^batch_normalization_15/gamma/Assign*^batch_normalization_15/moving_mean/Assign.^batch_normalization_15/moving_variance/Assign#^batch_normalization_16/beta/Assign$^batch_normalization_16/gamma/Assign*^batch_normalization_16/moving_mean/Assign.^batch_normalization_16/moving_variance/Assign#^batch_normalization_17/beta/Assign$^batch_normalization_17/gamma/Assign*^batch_normalization_17/moving_mean/Assign.^batch_normalization_17/moving_variance/Assign#^batch_normalization_18/beta/Assign$^batch_normalization_18/gamma/Assign*^batch_normalization_18/moving_mean/Assign.^batch_normalization_18/moving_variance/Assign#^batch_normalization_19/beta/Assign$^batch_normalization_19/gamma/Assign*^batch_normalization_19/moving_mean/Assign.^batch_normalization_19/moving_variance/Assign"^batch_normalization_2/beta/Assign#^batch_normalization_2/gamma/Assign)^batch_normalization_2/moving_mean/Assign-^batch_normalization_2/moving_variance/Assign#^batch_normalization_20/beta/Assign$^batch_normalization_20/gamma/Assign*^batch_normalization_20/moving_mean/Assign.^batch_normalization_20/moving_variance/Assign#^batch_normalization_21/beta/Assign$^batch_normalization_21/gamma/Assign*^batch_normalization_21/moving_mean/Assign.^batch_normalization_21/moving_variance/Assign#^batch_normalization_22/beta/Assign$^batch_normalization_22/gamma/Assign*^batch_normalization_22/moving_mean/Assign.^batch_normalization_22/moving_variance/Assign"^batch_normalization_3/beta/Assign#^batch_normalization_3/gamma/Assign)^batch_normalization_3/moving_mean/Assign-^batch_normalization_3/moving_variance/Assign"^batch_normalization_4/beta/Assign#^batch_normalization_4/gamma/Assign)^batch_normalization_4/moving_mean/Assign-^batch_normalization_4/moving_variance/Assign"^batch_normalization_5/beta/Assign#^batch_normalization_5/gamma/Assign)^batch_normalization_5/moving_mean/Assign-^batch_normalization_5/moving_variance/Assign"^batch_normalization_6/beta/Assign#^batch_normalization_6/gamma/Assign)^batch_normalization_6/moving_mean/Assign-^batch_normalization_6/moving_variance/Assign"^batch_normalization_7/beta/Assign#^batch_normalization_7/gamma/Assign)^batch_normalization_7/moving_mean/Assign-^batch_normalization_7/moving_variance/Assign"^batch_normalization_8/beta/Assign#^batch_normalization_8/gamma/Assign)^batch_normalization_8/moving_mean/Assign-^batch_normalization_8/moving_variance/Assign"^batch_normalization_9/beta/Assign#^batch_normalization_9/gamma/Assign)^batch_normalization_9/moving_mean/Assign-^batch_normalization_9/moving_variance/Assign^conv2d_1/kernel/Assign^conv2d_10/kernel/Assign^conv2d_11/kernel/Assign^conv2d_12/kernel/Assign^conv2d_13/kernel/Assign^conv2d_14/kernel/Assign^conv2d_15/kernel/Assign^conv2d_16/kernel/Assign^conv2d_17/kernel/Assign^conv2d_18/kernel/Assign^conv2d_19/kernel/Assign^conv2d_2/kernel/Assign^conv2d_20/kernel/Assign^conv2d_21/kernel/Assign^conv2d_22/kernel/Assign^conv2d_23/bias/Assign^conv2d_23/kernel/Assign^conv2d_3/kernel/Assign^conv2d_4/kernel/Assign^conv2d_5/kernel/Assign^conv2d_6/kernel/Assign^conv2d_7/kernel/Assign^conv2d_8/kernel/Assign^conv2d_9/kernel/Assign"