<template>
	<div class="big">
		<div class="header">
			<div class="left">
				<span class="date">2019年04月17日</span>
				<span class="week">星期三</span>
			</div>
			<div class="title">
				<span>上略互动数据可视化平台</span>
			</div>
			<div class="right">
				<span>已连接socket</span>
			</div>
		</div>
		<div class="content">
			<div class="row">
				<div class="col col-3">
					a
				</div>
				<div class="col col-6">
					b
				</div>
				<div class="col col-3">
					c
				</div>
			</div>
			<div class="row">
				<div class="col col-4">
					d
				</div>
				<div class="col col-4">
					e
				</div>
				<div class="col col-4">
					f
				</div>
			</div>
		</div>
	</div>
</template>

<script>
export default {
	name: 'views',
	created() {}
};
</script>

<style lang="less">
.big {
	background: #050714;
	width: 100vw;
	height: 100vh;
	.header {
		background: #121d49;
		border-bottom: 1px solid #38558e;
		width: 100%;
		position: relative;
		padding:5px;
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		color: white;
		&>div{
			font-size: 14px;
		}
		.left{
			.date,.week{
				padding:0px 5px;
			}
		}
		.right{
			padding-right: 10px;
		}
		.title {
			position: absolute;
			color: white;
			left: 50%;
			transform: translateX(-50%);
			top: 0px;
			font-size: 40px;
			text-align: center;
			font-family: '楷体';
			min-width: 380px;
			span{
				z-index: 1;
				display: block;
				padding: 0px 20px;
			}
			&:after{
				content: '';
				display: block;
				border-bottom: 28px solid #121d49;
				border-left: 18px solid transparent;
				border-right: 18px solid transparent;
				transform: rotate(180deg);
				position: absolute;
				top: 30px;
				width: 100%;
				z-index: -1;
			}
		}
	}
	
	.content{
		margin-top: 28px;
		display: flex;
		flex-direction: column;
	}

	.row{
		margin: 5px;
		display: flex;
		justify-content: space-between;
		height: calc((100vh - 60px) / 2 - 15px);
		.col{
			min-height: 200px;
			height: 100%;
			padding: 10px;
			margin: 5px;
			position: relative;
			background: #0d143c;
			&.col-3{
				width: calc(100% / 12 * 3)
			}
			&.col-4{
				width: calc(100% / 12 * 4)
			}
			&.col-6{
				width: calc(100% / 12 * 6)
			}
			
			&:before,
			&:after{
				content: '';
				display: block;
				width: 30px;
				height: 30px;
				background-image: url('../assets/views/cardBg.png');
				background-size: 100% 100%;
				background-repeat: no-repeat;
				position: absolute;
			}
			&:before{
				left: 0px;
				top: 0px;
				&:before{
					left: 0px;
					top: 0px;
				}
			}
			&:after{
				right: 0px;
				bottom: 0px;
				transform: rotate(180deg)
			}
		}
	}
}
</style>
