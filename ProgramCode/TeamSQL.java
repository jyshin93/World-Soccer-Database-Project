package codingChallenge;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.File;
import java.io.IOException;
import java.text.Normalizer;
import java.util.HashMap;
import java.util.Scanner;
import java.util.regex.Pattern;

public class TeamSQL {

	public static void main(String[] args) {

		// String csvFile =
		// "/Users/jinyongshin/Dropbox/DBFinal/national/list_of_leagues.csv";
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
		// write in fileString
		String textList = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/Team/name.txt";
		BufferedReader br_list = null;
		BufferedWriter bw = null;
		try {
			String Name = "";
			String savedFile = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/League_teams.sql";
			File file = new File(savedFile);
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			HashMap<String, Integer> teams = new HashMap<String, Integer>();
			br_list = new BufferedReader(new FileReader(textList));
			bw = new BufferedWriter(fw);
			String LeagueID = "";
			while ((Name = br_list.readLine()) != null) {
				String csvFile = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/Team/" + Name;
				if (Name.equals("bun_teams.txt")) {
					LeagueID = "a001";
				} else if (Name.equals("epl_teams.txt")) {
					LeagueID = "a002";
				} else {
					LeagueID = "a003";
				}
				br = new BufferedReader(new FileReader(csvFile));
				while ((line = br.readLine()) != null) {
					line = deAccent(line);
					String outputVal = "INSERT INTO League_teams VALUES (\"" + LeagueID + "\", \"" + line + "\"); \n";
					bw.write(outputVal);
					
				}
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
					bw.close();
					br_list.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}
	public static String deAccent(String str) {
	    String nfdNormalizedString = Normalizer.normalize(str, Normalizer.Form.NFD); 
	    Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
	    return pattern.matcher(nfdNormalizedString).replaceAll("");
	}

}