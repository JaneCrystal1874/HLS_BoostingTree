-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cLz_rom is 
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


architecture rtl of predict_ensemble_cLz_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0", 2 => "1", 3 to 4=> "0", 5 => "1", 6 to 8=> "0", 9 => "1", 10 => "0", 
    11 to 12=> "1", 13 => "0", 14 to 16=> "1", 17 to 18=> "0", 19 => "1", 20 => "0", 21 to 23=> "1", 
    24 to 25=> "0", 26 to 27=> "1", 28 => "0", 29 => "1", 30 to 31=> "0", 32 => "1", 33 => "0", 
    34 => "1", 35 => "0", 36 => "1", 37 => "0", 38 => "1", 39 => "0", 40 => "1", 
    41 to 42=> "0", 43 => "1", 44 to 46=> "0", 47 => "1", 48 to 49=> "0", 50 to 51=> "1", 52 => "0", 
    53 => "1", 54 => "0", 55 => "1", 56 => "0", 57 => "1", 58 => "0", 59 => "1", 
    60 => "0", 61 => "1", 62 => "0", 63 to 64=> "1", 65 => "0", 66 => "1", 67 to 70=> "0", 
    71 to 72=> "1", 73 to 75=> "0", 76 to 81=> "1", 82 => "0", 83 => "1", 84 => "0", 85 => "1", 
    86 => "0", 87 => "1", 88 to 89=> "0", 90 => "1", 91 => "0", 92 => "1", 93 => "0", 
    94 to 95=> "1", 96 to 97=> "0", 98 => "1", 99 to 104=> "0", 105 => "1", 106 => "0", 107 => "1", 
    108 to 112=> "0", 113 to 119=> "1", 120 => "0", 121 => "1", 122 => "0", 123 => "1", 124 => "0", 
    125 to 126=> "1", 127 => "0", 128 => "1", 129 to 130=> "0", 131 => "1", 132 to 133=> "0", 134 to 136=> "1", 
    137 => "0", 138 to 139=> "1", 140 => "0", 141 to 142=> "1", 143 to 144=> "0", 145 to 146=> "1", 147 to 148=> "0", 
    149 => "1", 150 => "0", 151 to 154=> "1", 155 to 158=> "0", 159 => "1", 160 => "0", 161 => "1", 
    162 to 163=> "0", 164 to 166=> "1", 167 to 168=> "0", 169 => "1", 170 => "0", 171 => "1", 172 to 173=> "0", 
    174 to 176=> "1", 177 => "0", 178 to 179=> "1", 180 => "0", 181 to 182=> "1", 183 => "0", 184 to 186=> "1", 
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

entity predict_ensemble_cLz is
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

architecture arch of predict_ensemble_cLz is
    component predict_ensemble_cLz_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cLz_rom_U :  component predict_ensemble_cLz_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


