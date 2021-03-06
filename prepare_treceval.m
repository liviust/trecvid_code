function prepare_treceval(test_id, queryNames)

queries = readList(queryNames);
load('../keyframe2shot.mat')
mkdir(strcat('../results/',test_id,'/results_treceval'));
for i=1:numel(queries)
    t = str2double(queries{i}(1:4));
    q = str2double(queries{i}(6));
    organizeTRECeval(keyframe2shot,test_id,queries{i},t,q);
    
end

exit
end
