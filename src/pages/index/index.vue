<template>
    <view class="page">
        <b-card title="store使用" type="text">
            <div>count:{{ count }}</div>
            <div>info.height:{{ info.height }}</div>
        </b-card>

        <div class="card">
            <b-card title="pinia使用">
                <div class="c-flex-center block">
                    <uni-tag
                        :text="`count值：${count}`"
                        type="primary"
                        class="tag"
                        :inverted="true"
                    />
                    <Plus1 :size="16" @click="handleAddCount"/>
                </div>
                <div class="c-flex-center block">
                    <uni-tag
                        :text="`age${info.age}`"
                        type="primary"
                        class="tag"
                        :inverted="true"
                    />
                    <Plus1 :size="16" @click="handleAddAge"/>
                </div>
            </b-card>
        </div>
        <div class="card">
            <b-card>
                <Test/>
            </b-card>
        </div>
    </view>
</template>

<script lang="ts" setup>
import {onInit} from '@dcloudio/uni-app';
import {API} from '@/utils/api';
import {request} from '@/utils/request';
import Plus1 from '@baidu/uni-view/components/uni-view-acgicon/dist/Plus1.vue';
import {useGlobalStore} from '@/store/index';
import {storeToRefs} from 'pinia';

const globalStore = useGlobalStore();
const {count, info} = storeToRefs(globalStore);

// 直接修改state
const handleAddCount = () => {
    globalStore.addCount();
};

const handleAddAge = () => {
    globalStore.addAge();
};

onInit(async () => {
    const data = await request.get(API.TBA1.BANNER).catch();
    console.log('data', data);
});

</script>

<style lang="scss">
.page {
    padding: 10px;
    .card {
        margin-top: 20px;
    }
    .block {
        height: 30px;
    }
}


</style>
