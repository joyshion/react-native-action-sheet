
import { NativeModules } from 'react-native';

const { RNActionSheet } = NativeModules;

const defaultOptions = {
    title: 'ActionSheet',
    cancelText: 'Cancel',
    items: [{
        key: 'item1',
        title: 'item1'
    }, {
        key: 'item2',
        title: 'item2'
    }]
};

export default {
    show: (options, callback) => {
        callback = callback == null ? () => {} : callback;
        RNActionSheet.show({
            ...defaultOptions, ...options
        }, callback);
    }
};
