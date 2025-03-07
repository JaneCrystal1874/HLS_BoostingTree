-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cVB_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_cVB_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 5=> "0", 6 => "1", 7 to 8=> "0", 9 to 11=> "1", 12 => "0", 
    13 to 14=> "1", 15 to 17=> "0", 18 to 19=> "1", 20 => "0", 21 => "1", 22 => "0", 23 to 24=> "1", 
    25 => "0", 26 => "1", 27 => "0", 28 => "1", 29 to 30=> "0", 31 to 33=> "1", 34 to 35=> "0", 
    36 => "1", 37 => "0", 38 => "1", 39 to 40=> "0", 41 => "1", 42 => "0", 43 => "1", 
    44 => "0", 45 => "1", 46 to 47=> "0", 48 to 49=> "1", 50 to 51=> "0", 52 => "1", 53 => "0", 
    54 => "1", 55 to 57=> "0", 58 to 60=> "1", 61 to 64=> "0", 65 to 66=> "1", 67 => "0", 68 to 72=> "1", 
    73 => "0", 74 => "1", 75 => "0", 76 => "1", 77 => "0", 78 => "1", 79 => "0", 
    80 => "1", 81 to 84=> "0", 85 => "1", 86 to 87=> "0", 88 => "1", 89 => "0", 90 => "1", 
    91 to 92=> "0", 93 to 96=> "1", 97 => "0", 98 => "1", 99 to 101=> "0", 102 => "1", 103 => "0", 
    104 => "1", 105 => "0", 106 to 109=> "1", 110 => "0", 111 => "1", 112 => "0", 113 => "1", 
    114 => "0", 115 => "1", 116 => "0", 117 to 119=> "1", 120 => "0", 121 => "1", 122 => "0", 
    123 => "1", 124 to 126=> "0", 127 => "1", 128 to 130=> "0", 131 => "1", 132 => "0", 133 => "1", 
    134 to 136=> "0", 137 to 138=> "1", 139 to 140=> "0", 141 to 142=> "1", 143 to 144=> "0", 145 => "1", 146 to 147=> "0", 
    148 to 150=> "1", 151 => "0", 152 => "1", 153 => "0", 154 to 156=> "1", 157 => "0", 158 => "1", 
    159 => "0", 160 => "1", 161 to 162=> "0", 163 to 164=> "1", 165 => "0", 166 => "1", 167 to 168=> "0", 
    169 to 172=> "1", 173 to 175=> "0", 176 to 178=> "1", 179 to 180=> "0", 181 to 183=> "1", 184 => "0", 185 to 186=> "1", 
    187 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_cVB is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_cVB is
    component predict_ensemble_cVB_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cVB_rom_U :  component predict_ensemble_cVB_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


