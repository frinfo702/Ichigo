% フォルダパスを指定
folderPath = 'path/to/your/folder'; % ここに.matファイルがあるフォルダのパスを指定してください
outputPath = 'path/to/output/folder'; % ここに出力先のフォルダパスを指定してください

% フォルダ内のすべての.matファイルを取得
matFiles = dir(fullfile(folderPath, '*.mat'));

% 各.matファイルに対して処理を行う
for i = 1:length(matFiles)
    % .matファイルを読み込む
    fileName = matFiles(i).name;
    filePath = fullfile(folderPath, fileName);
    FileData = load(filePath);
    
    % ファイル名から拡張子を除いた部分を取得
    [~, baseName, ~] = fileparts(fileName);
    
    % 構造体のフィールドを処理
    fields = fieldnames(FileData);
    for K = 1 : length(fields)
        thisvar = fields{K};
        thisdata = FileData.(thisvar);
        if ~isnumeric(thisdata)
            warning('Skipping field %s in file %s which is type %s instead of numeric', thisvar, fileName, class(thisdata));
        else
            % CSVファイル名を生成
            thisfile = sprintf('%s_%s_%s.csv', baseName, thisvar, datestr(now, 'yyyymmdd_HHMMSS'));
            % CSVファイルを出力フォルダに保存
            csvwrite(fullfile(outputPath, thisfile), thisdata);
            fprintf('Saved %s\n', thisfile);
        end
    end
end

fprintf('処理が完了しました。\n');