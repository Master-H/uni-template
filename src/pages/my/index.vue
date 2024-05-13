<template>
    <view class="page">
        <div class="head">
            <image
                src="@/static/images/my-head-banner.png"
                mode="scaleToFill"
                class="head-bg"
            />
            <b-nav-bar title="我的"/>
            <div class="card">
                <b-card>
                    <div class="user-box">
                        <image
                            src="@/static/images/user.png"
                            mode="scaleToFill"
                            class="user-image"
                        />
                        <div class="user-info">
                            <div v-if="isLogin">
                                <div class="text c-fw500">微信用户</div>
                                <div class="phone c-fw400">{{ userPhone }}</div>
                            </div>
                            <div
                                v-else class="text"
                                @click="handleLogin"
                            >立即登录</div>
                        </div>
                    </div>
                    <b-grid
                        :data="gridData" :image-style="imageStyle"
                        @click="handleClickGrid"
                    />
                </b-card>
            </div>
        </div>

        <div class="content">
            <b-list-item
                v-for="(info, index) in infoList"
                :key="index"
                :title="info.text"
                show-arrow
                @click="handleList(info)"
            />
        </div>

    </view>
</template>

<script lang="ts" setup>
import {ref, reactive} from 'vue';
import TO_PAY from '@/static/images/my-to-pay.png';
import ORDER from '@/static/images/my-order.png';
import COUPON from '@/static/images/my-coupon.png';
import {Utils} from '@/utils';

const isLogin = ref(false);
const userPhone = ref('');

interface Info {
    text: string;
    jumpType?: string;
    jumpUrl: string;
    type: string;
    icon?: string;
}
interface Grid {
    title: string;
    jumpType?: string;
    jumpUrl: string;
    type: string;
    url?: string;
}
const infoList = reactive<Array<Info>>([
    {
        text: '我的车辆',
        jumpType: 'applet',
        jumpUrl: '/pages/my-car/index',
        type: 'jump',
    },
    {
        text: '电子发票',
        jumpType: 'applet',
        jumpUrl: '/pages/invoice/index',
        type: 'jump',
    },
    {
        text: 'ETC支付',
        jumpType: 'applet',
        jumpUrl: '/pages/etc/index',
        type: 'jump',
    },
    {
        text: '车牌申诉',
        jumpType: 'applet',
        jumpUrl: '/pages/car-appeal/index',
        type: 'jump',
    },
    {
        text: '车辆认证',
        jumpType: 'applet',
        jumpUrl: '/pages/car-verify/entry/index',
        type: 'jump',
    },
    {
        text: '联系客服',
        jumpType: 'applet',
        jumpUrl: '/pages/index',
        type: 'phone',
    },
]);

const gridData = reactive<Array<Grid>>([
    {
        title: '待支付',
        jumpUrl: '/pages/orders/toPay/index?payStatus=READY_FOR_PAY',
        type: 'jump',
        url: TO_PAY,
    },
    {
        title: '全部订单',
        jumpUrl: '/pages/orders/index',
        type: 'jump',
        url: ORDER,
    },
    {
        title: '优惠券',
        jumpUrl: '/pages/coupon/index',
        type: 'jump',
        url: COUPON,
    },
]);

const imageStyle = {
    width: '48rpx',
    height: '48rpx',
};

const handleLogin = () => {
    Utils.commonJump('/pages/login/index');
};

const handleList = async (info: Info) => {
    console.log('jump', info);

};
const handleClickGrid = async (info: Info) => {
    console.log('grid--info', info);
};

</script>

<style lang="scss">
.page {
    overflow: auto;

    .head {
        overflow: visible;
        .head-bg {
            width: 100%;
            height: 392rpx;
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
        }
        .card {
            margin: 24rpx 32rpx;
        }
        .user-box {
            display: flex;

            .user-image {
                width: 112rpx;
                height: 112rpx;
                margin-right: 32rpx;
            }
            .user-info {
                display: flex;
                flex-direction: column;
                justify-content:center ;
                align-items: center;
                padding-top: 16rpx;
                padding-bottom: 16rpx;

                .text {
                    font-size: 36rpx;
                    color: #000000;
                    letter-spacing: 0;
                    line-height: 56rpx;
                    font-weight: 500;
                }
                .phone {
                    font-size: 28rpx;
                    color: #5C5F66;
                    letter-spacing: 0;
                    line-height: 40rpx;
                    font-weight: 400;
                }
            }
        }
        .slot {
            margin-top: 56rpx;
            padding-left: 36rpx;
            padding-right: 36rpx;
            display: flex;
            justify-content: space-between;
        }
    }
    .content {
        margin-top: 40rpx;
        padding-left: 48rpx;
        padding-right: 48rpx;
    }
}
::v-deep .uni-view-grid__row__vertical__item {
    padding-bottom: 0 !important;
}
</style>
