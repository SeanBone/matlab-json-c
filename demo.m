function demo()
    jsonc_string = fileread("demo.jsonc");

    fprintf("Original string:\n%s\n", jsonc_string);

    fprintf("String without comments:\n%s\n", jsonc.removeJSONComments(jsonc_string));

    recoveredData = jsonc.jsoncDecode(jsonc_string)

    fprintf("Data re-encoded to JSON:\n%s\n", jsonc.jsonEncode(recoveredData));
end
