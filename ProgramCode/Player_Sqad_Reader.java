package codingChallenge;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Pattern;

public class Player_Sqad_Reader {
	public static void main(String[] args) throws IOException {
		String textList = "/Users/jinyongshin/Desktop/Database_Final/squads/2010.txt";
		BufferedReader br_list = null;
		br_list = new BufferedReader(new FileReader(textList));
		String savedFile = "/Users/jinyongshin/Desktop/Database_Final/" + "2010Squad.sql";
		File file = new File(savedFile);
		FileWriter fw = new FileWriter(file.getAbsoluteFile());
		BufferedWriter bw = null;
		bw = new BufferedWriter(fw);
		String Name = "";
		while ((Name = br_list.readLine()) != null) {

			String txtFile = "/Users/jinyongshin/Desktop/Database_Final/squads/2010/" + Name;

			BufferedReader br = null;
			String line = "";
			// write in file

			// Select Country Name out of file
			int index = Name.indexOf('.');
			String country = Name.substring(3, index);

			br = new BufferedReader(new FileReader(txtFile));
			while ((line = br.readLine()) != null) {
				String data[] = line.split(" ");
				Scanner kb = new Scanner(line);
				int i = 0;
				String position = "";
				String LastName = "";
				String FirstName = "";
				String Number = "";
				String Club = "";
				boolean cor = false;
				if (line.length() > 40) {
					while (kb.hasNext()) {
						String start = kb.next();
						if (start.charAt(0) == '(' || start.charAt(1) == '(') {
							cor = true;
							position = kb.next();
							ArrayList<String> name_list = new ArrayList<String>();
							String name = "";
							while (!(name = kb.next()).equals("##")) {
								name_list.add(name);
							}
							if (name_list.size() == 1) {
								FirstName = name_list.get(0);
								LastName = " ";
							} else if (name_list.size() > 1) {
								FirstName = name_list.get(0);
								LastName = name_list.get(1);
								for (int j = 2; j < name_list.size(); j++) {
									LastName = LastName + " " + name_list.get(j);
								}
							} 
							Number = kb.next();
							Number = Number.substring(0, Number.length() - 1);
							if (kb.hasNext()) {
								Club = kb.next();
								if (kb.hasNext()) {
									String club_next = kb.next();
									if (club_next.charAt(0) != '(') {
										Club = Club + " " + club_next;
									}
								}
							}
						}
						break;
					}
				}
				FirstName = deAccent(FirstName);
				LastName = deAccent(LastName);
				Club = deAccent(Club);
				
				String outputVal = "INSERT INTO AllSquad VALUES ('2010', '" + country + "', '" + position + "', \""
						+ FirstName + "\", \"" + LastName + "\", '" + Number + "', \"" + Club + "\"); \n";
				if (cor) {
					bw.write(outputVal);
				}
				// use comma as separator
			}
			br.close();
		}

		bw.close();
	}
	public static String deAccent(String str) {
	    String nfdNormalizedString = Normalizer.normalize(str, Normalizer.Form.NFD); 
	    Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
	    return pattern.matcher(nfdNormalizedString).replaceAll("");
	}
}
