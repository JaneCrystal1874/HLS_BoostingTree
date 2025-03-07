-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_crw_rom is 
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


architecture rtl of predict_ensemble_crw_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0", 4 to 6=> "1", 7 => "0", 8 => "1", 9 to 11=> "0", 12 to 15=> "1", 16 => "0", 
    17 => "1", 18 to 19=> "0", 20 to 21=> "1", 22 to 29=> "0", 30 to 34=> "1", 35 => "0", 36 to 38=> "1", 
    39 to 40=> "0", 41 => "1", 42 to 44=> "0", 45 => "1", 46 to 47=> "0", 48 to 49=> "1", 50 => "0", 
    51 => "1", 52 => "0", 53 to 54=> "1", 55 => "0", 56 to 57=> "1", 58 to 59=> "0", 60 to 62=> "1", 
    63 => "0", 64 to 65=> "1", 66 to 67=> "0", 68 => "1", 69 to 73=> "0", 74 to 75=> "1", 76 => "0", 
    77 to 78=> "1", 79 => "0", 80 => "1", 81 => "0", 82 => "1", 83 to 86=> "0", 87 => "1", 
    88 => "0", 89 => "1", 90 => "0", 91 to 92=> "1", 93 to 95=> "0", 96 => "1", 97 => "0", 
    98 to 102=> "1", 103 => "0", 104 => "1", 105 to 108=> "0", 109 => "1", 110 => "0", 111 to 116=> "1", 
    117 to 118=> "0", 119 => "1", 120 => "0", 121 => "1", 122 to 123=> "0", 124 => "1", 125 to 126=> "0", 
    127 => "1", 128 to 130=> "0", 131 to 132=> "1", 133 => "0", 134 => "1", 135 => "0", 136 to 139=> "1", 
    140 to 141=> "0", 142 => "1", 143 to 145=> "0", 146 => "1", 147 => "0", 148 => "1", 149 => "0", 
    150 to 151=> "1", 152 => "0", 153 to 157=> "1", 158 to 161=> "0", 162 => "1", 163 to 166=> "0", 167 to 168=> "1", 
    169 to 170=> "0", 171 to 174=> "1", 175 to 177=> "0", 178 to 180=> "1", 181 => "0", 182 to 183=> "1", 184 => "0", 
    185 => "1", 186 => "0", 187 to 190=> "1", 191 to 194=> "0" );

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

entity predict_ensemble_crw is
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

architecture arch of predict_ensemble_crw is
    component predict_ensemble_crw_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_crw_rom_U :  component predict_ensemble_crw_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


