function [ normalizedData ] = NormalizeData( data, columnsToNormalize )
%NormalizeData Normalizes some columns to zero mean and unity variance
    normalizedData = data;
    for iColumn = columnsToNormalize
        normalizedData(:,iColumn) = normalizedData(:,iColumn) - mean(normalizedData(:,iColumn));
        normalizedData(:,iColumn) = normalizedData(:,iColumn)/std(normalizedData(:,iColumn));
    end
end

